terraform {
  required_providers {
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "~> 1.20"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
    clickhouse = {
      source  = "ClickHouse/clickhouse"
    }
  }
}


provider "postgresql" {
  host            = "localhost"
  port            = 5432
  username        = "admin"
  password        = "adminpass"
  sslmode         = "disable"
  connect_timeout = 15
}

# Create a new database
resource "postgresql_database" "appdb" {
  name = "${var.app_name}_db"
  owner = "admin"
}

# Create a new user
resource "postgresql_role" "appuser" {
  name     = "${var.app_name}_user"
  password = "${var.app_name}_pass"
  login    = true
}

# Grant privileges to user on the database
resource "postgresql_grant" "appuser_db_access" {
  database    = postgresql_database.appdb.name
  role        = postgresql_role.appuser.name
  object_type = "database"
  privileges  = ["CONNECT", "TEMPORARY"]
}

# Grant usage on schema so the user can access tables
resource "postgresql_grant" "appuser_schema_usage" {
  database    = postgresql_database.appdb.name
  role        = postgresql_role.appuser.name
  object_type = "schema"
  schema      = "public"
  privileges  = ["USAGE", "CREATE"]
}

# Grant full table privileges (SELECT, INSERT, UPDATE, DELETE)
resource "postgresql_grant" "appuser_table_privileges" {
  database    = postgresql_database.appdb.name
  role        = postgresql_role.appuser.name
  object_type = "table"
  schema      = "public"
  privileges  = ["SELECT", "INSERT", "UPDATE", "DELETE"]
}

# Grant privileges on sequences (for serial/auto-increment columns)
resource "postgresql_grant" "appuser_sequence_privileges" {
  database    = postgresql_database.appdb.name
  role        = postgresql_role.appuser.name
  object_type = "sequence"
  schema      = "public"
  privileges  = ["USAGE", "SELECT", "UPDATE"]
}

# Depends on database and user creation
resource "docker_image" "app_image" {
  name = "${var.registry_host}/${var.app_name}:${var.image_tag}"
}

resource "docker_container" "my_app_container" {

  name  = "${var.app_name}_container"
  image = docker_image.app_image.name

  ports {
    internal = 8080
    external = 8080
  }

  log_driver = "json-file"

  log_opts = {
    "max-size" = "10m"
    "max-file" = "3"
  }

  env = [
    "REGISTRY_STORAGE_DELETE_ENABLED=true",
    "DB_HOST=localhost",
    "DB_PORT=5432",
    "DB_NAME=${postgresql_database.appdb.name}",
    "DB_USER=${postgresql_role.appuser.name}",
    "DB_PASSWORD=${postgresql_role.appuser.password}",
    "JWT_SECRET=${var.app_name}_secret",
  ]

  network_mode = "host"

  depends_on = [
    postgresql_grant.appuser_db_access,
    postgresql_grant.appuser_schema_usage,
    postgresql_grant.appuser_table_privileges,
    postgresql_grant.appuser_sequence_privileges
  ]
}