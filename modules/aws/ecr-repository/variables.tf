variable "repository_name" {
  description = "Name of the ECR repository"
  type        = string
}

variable "lifecycle_policy" {
  description = "JSON string for the lifecycle policy"
  type        = string
}

variable "cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
}