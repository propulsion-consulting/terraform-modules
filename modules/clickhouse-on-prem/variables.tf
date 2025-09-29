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

variable "http_internal_port" {
  description = "Internal HTTP port for Clickhouse"
  type        = number
}

variable "http_external_port" {
  description = "External HTTP port for Clickhouse"
  type        = number
}

variable "client_internal_port" {
  description = "Internal native client port for Clickhouse"
  type        = number
}

variable "client_external_port" {
  description = "External native client port for Clickhouse"
  type        = number
}

variable "db_internal_port" {
  description = "Internal database port for Clickhouse"
  type        = number
}

variable "db_external_port" {
  description = "External database port for Clickhouse"
  type        = number
}

variable "environment_variables" {
  description = "Environment variables for the container"
  type        = list(string)
  default     = []
}