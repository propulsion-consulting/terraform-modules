variable "alias" {
  description = "Name of postgres deployment instance"
  type        = string
}

variable "environment_variables" {
  description = "Environment variables for the container"
  type        = list(string)
  default     = []
}

