resource "aws_ecs_task_definition" "service" {

  family = "${var.service_name}"
  network_mode = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu    = var.cpu_usage
  memory = var.memory_usage
  execution_role_arn = var.task_execution_role_arn

  container_definitions = jsonencode([
    {
      name      = "${var.service_name}-http"
      image     = "${var.ecr_repository_url}:${var.image_tag}"
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

  tags = {
    Terraform = "true"
    Name      = "${var.service_name}-task-definition"
    Environment = "${var.environment}"
  }

}

# CloudWatch Log Group
resource "aws_cloudwatch_log_group" "ecs_logs" {
  name              = "/ecs/${var.service_name}"
  retention_in_days = 30

  tags = {
    Name        = "${var.service_name}-logs"
    Environment = "${var.environment}"
    Terraform   = "true"
  }
}

resource "aws_ecs_service" "app" {
  name            = "${var.service_name}-service"
  cluster         = var.ecs_cluster_id
  task_definition = aws_ecs_task_definition.service.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = var.public_subnets
    security_groups  = var.security_groups
    assign_public_ip = true
  }

  tags = {
    Name        = "${var.service_name}-ecs-service"
    Environment = "${var.environment}"
    Terraform   = "true"
  }
}
