resource "aws_ecr_repository" "container_app_registry" {
  name                 = "${var.repository_name}"
  image_tag_mutability = "IMMUTABLE_WITH_EXCLUSION"

  image_tag_mutability_exclusion_filter {
    filter      = "latest*"
    filter_type = "WILDCARD"
  }

  image_tag_mutability_exclusion_filter {
    filter      = "dev-*"
    filter_type = "WILDCARD"
  }

  image_tag_mutability_exclusion_filter {
    filter      = "prod-*"
    filter_type = "WILDCARD"
  }

  tags = {
    Environment = "prod"
    Terraform     = "true"
  }

}

resource "aws_ecr_lifecycle_policy" "example" {
  repository = aws_ecr_repository.container_app_registry.name
  policy = var.lifecycle_policy
}

resource "aws_ecr_cluster" "ecs_cluster" {
  name = "${var.repository_name}-cluster"

  settings {
    name  = "containerInsights"
    value = "enabled"
  }
}

