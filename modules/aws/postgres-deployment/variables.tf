variable "db_parameter_group_name" {
  description = "Name of the DB parameter group"
  type        = string
}

variable "db_instance_name" {
  description = "Name of the DB instance"
  type        = string
}

variable "admin_db_user" {
  description = "Name of the admin DB user"
  type        = string
}

variable "admin_db_password" {
  description = "Password for the admin DB user"
  type        = string
}

variable "db_security_group_ids" {
  description = "Security group IDs for the DB instance"
  type        = list(string)
  default     = []
}