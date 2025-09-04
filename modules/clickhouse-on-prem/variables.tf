variable "image_name" {
  description = "Docker image for ClickHouse"
  type        = string
}

variable "container_name" {
  description = "Docker container name for ClickHouse"
  type        = string
}

variable "clickhouse_volume_name" {
  description = "Name of the clickhouse docker volume"
  type        = string
}

variable "environment_variables" {
  description = "Environment variables for the container"
  type        = list(string)
  default     = []
}