variable "service_name" {
  description = "Name of the ECS service"
  type        = string
}

variable "ecr_repository_url" {
  description = "URL of the ECR repository"
  type        = string
}

variable "image_tag" {
  description = "Tag of the Docker image"
  type        = string
  default     = "latest"
}

variable "cpu_usage" {
  description = "CPU units for the container"
  type        = number
  default     = 256
}

variable "memory_usage" {
  description = "Memory in MiB for the container"
  type        = number
  default     = 512
}

