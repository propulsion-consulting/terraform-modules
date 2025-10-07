resource "aws_ecs_task_definition" "service" {
  family = "${var.service_name}"
  container_definitions = jsonencode([
    {
      name      = "${var.service_name}-http"
      image     = "${var.ecr_repository_url}:${var.image_tag}"
      cpu       = var.cpu_usage
      memory    = var.memory_usage
      essential = true
      environment_variables = var.environment_variables
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    },
    {
      name      = "${var.service_name}-https"
      image     = "${var.ecr_repository_url}:${var.image_tag}"
      cpu       = var.cpu_usage
      memory    = var.memory_usage
      essential = true
      environment_variables = var.environment_variables
      portMappings = [
        {
          containerPort = 443
          hostPort      = 443
        }
      ]
    }
  ])

  volume {
    name      = "service-storage"
    host_path = "/ecs/service-storage"
  }

  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [us-east-2a, us-east-2b]"
  }
}