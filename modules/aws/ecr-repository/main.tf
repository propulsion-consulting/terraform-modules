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

resource "aws_ecr_lifecycle_policy" "container_app_registry_policy" {
  repository = aws_ecr_repository.container_app_registry.name

    policy = jsonencode({
      rules = [
        {
          rule_priority = 1
          description   = "${var.lifecycle_policy_description}"
          selection     = {
            count_type        = "${var.lifecycle_policy_count_type}"
            count_number      = var.lifecycle_policy_count_number
            tag_status        = "tagged"
            tag_prefix_list   = var.lifecycle_policy_tag_prefix_list
          }
          action = {
            type = "expire"
          }
        }
      ]
    })
}