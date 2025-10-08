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

resource "aws_ecr_lifecycle_policy" "lifecycle_policy" {
    repository = aws_ecr_repository.container_app_registry.name
    policy = var.lifecycle_policy
    depends_on = [aws_ecr_repository.container_app_registry]
}

resource "aws_ecs_cluster" "ecs_cluster" {
  name = "${var.cluster_name}"
  tags = {
    Environment = "prod"
    Terraform     = "true"
  }
}

resource "aws_iam_role" "ecs_task_execution_role" {
  name = "${var.cluster_name}-task-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Environment = "prod"
    Terraform     = "true"
  }
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_policy" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

