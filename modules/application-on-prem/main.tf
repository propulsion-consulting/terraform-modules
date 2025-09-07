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
}