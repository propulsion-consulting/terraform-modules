# Create a VPC
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.vpc_name}"
  cidr = "${var.vpc_cidr}"

  azs             = var.vpc_azs
  public_subnets  = var.vpc_public_subnets

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Terraform = "true"
    Environment = "${var.environment}"
  }
}


# Create a DB subnet group for RDS
resource "aws_db_subnet_group" "propulsion" {
  name       = "${var.db_subnet_group_name}"
  subnet_ids = module.vpc.public_subnets

  tags = {
    Terraform = "true"
    Name = "${var.environment}"
  }
}

# Allow access for postgres on port 5432 from anywhere
resource "aws_security_group" "rds" {
  name   = "${var.db_security_group_name}"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Terraform = "true"
    Name = "${var.db_security_group_name}"
  }
}

# Security Group for ECS Tasks
resource "aws_security_group" "ecs_tasks" {
  name        = "${var.vpc_name}-ecs-tasks-sg"
  description = "Allow inbound traffic for ECS tasks"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "Allow HTTP inbound"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.vpc_name}-ecs-tasks-sg"
    Environment = "${var.environment}"
  }
}