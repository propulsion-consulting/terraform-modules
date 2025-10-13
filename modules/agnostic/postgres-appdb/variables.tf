variable "admin_db_name" {
  description = "Host of the image registry"
  type        = string
}

variable "admin_db_host" {
  description = "Name of the application"
  type        = string
}

variable "admin_db_port" {
  description = "Port number used to connect to the admin PostgreSQL database"
  type        = number
}

variable "admin_db_user" {
  description = "Username for connecting to the admin PostgreSQL database"
  type        = string
}

variable "admin_db_pass" {
  description = "Password for the admin PostgreSQL user"
  type        = string
}

variable "admin_db_connection_timeout" {
  description = "Timeout (in seconds) for connecting to the admin PostgreSQL database"
  type        = number
}

variable "app_db_name" {
  description = "Name of the application-specific PostgreSQL database to create"
  type        = string
}

variable "app_db_user" {
  description = "Username for the application to connect to the database"
  type        = string
}

variable "app_db_pass" {
  description = "Password for the application database user"
  type        = string
}

