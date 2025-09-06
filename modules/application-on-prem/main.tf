terraform {
  required_providers {
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "~> 1.20"
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
  name = var.app_db_name
  owner = "admin"
}

# Create a new user
resource "postgresql_role" "appuser" {
  name     = var.app_db_user
  password = var.app_db_password
  login    = true
}

# Grant privileges to user on the database
resource "postgresql_grant" "appuser_db_access" {
  database    = postgresql_database.appdb.name
  role        = postgresql_role.appuser.name
  object_type = "database"
  privileges  = ["CONNECT", "TEMPORARY"]
}