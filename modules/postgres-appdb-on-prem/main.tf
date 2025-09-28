provider "postgresql" {
  host            = "${var.admin_db_host}"
  port            = var.admin_db_port
  username        = "${var.admin_db_user}"
  password        = "${var.admin_db_pass}"
  sslmode         = "disable"
  connect_timeout = var.admin_db_connection_timeout
}

# Create a new user
resource "postgresql_role" "appuser" {
  name     = "${var.app_db_user}"
  password = "${var.app_db_pass}"
  login    = true
}

# Create a new database with user as owner
resource "postgresql_database" "appdb" {
  name = "${var.app_db_name}"
  owner = postgresql_role.appuser.name
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
