variable "registry_host" {
  description = "Hostname or address of the container image registry"
  type        = string
}

variable "app_name" {
  description = "Name of the application (used for container name, DB, etc.)"
  type        = string
}

variable "image_tag" {
  description = "Tag of the Docker image to deploy (e.g., latest, v1.0.0)"
  type        = string
}

variable "internal_port" {
  description = "Internal port the application listens on inside the container"
  type        = number
}

variable "external_port" {
  description = "External port to expose the application on the host machine"
  type        = number
}

variable "max_size_log" {
  description = "Maximum size of a single log file before rotation (e.g., '10m')"
  type        = string
}

variable "max_file_log" {
  description = "Maximum number of rotated log files to keep"
  type        = string
}

variable "environment_variables" {
  description = "Environment variables for the container"
  type        = list(string)
  default     = []
}