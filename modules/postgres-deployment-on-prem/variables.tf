variable "alias" {
  description = "Name of postgres deployment instance"
  type        = string
}

variable "internal_port" {
  description = "Internal port for postgres databases"
  type        = number
}

variable "external_port" {
  description = "External port for postgres databases"
  type        = number
}

variable "environment_variables" {
  description = "Environment variables for the container"
  type        = list(string)
  default     = []
}

