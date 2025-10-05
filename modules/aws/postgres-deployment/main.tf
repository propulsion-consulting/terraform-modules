resource "aws_db_parameter_group" "pg_db_parameter_group" {
  name   = "${var.db_parameter_group_name}"
  family = "postgres14"

  parameter {
    name  = "log_connections"
    value = "1"
  }
}

resource "aws_db_instance" "pg_db_instance" {
  identifier             = "${var.db_instance_name}"
  instance_class         = "db.t3.micro"
  allocated_storage      = 5
  engine                 = "postgres"
  engine_version         = "14"
  username               = "${var.admin_db_user}"
  password               = "${var.admin_db_password}"
  db_subnet_group_name    = var.db_subnet_group_name
  parameter_group_name   = aws_db_parameter_group.pg_db_parameter_group.name
  publicly_accessible    = true
  skip_final_snapshot    = true
}