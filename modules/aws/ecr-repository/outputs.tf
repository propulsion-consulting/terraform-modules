output "repository" {
  description = "Name of the ECR repository"
  value       = aws_ecr_repository.container_app_registry.name
}