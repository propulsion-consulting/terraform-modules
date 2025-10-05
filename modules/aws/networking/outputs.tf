output "db_subnet_group_name" {
  description = "Name of the DB subnet group"
  value       = module.aws_db_subnet_group.propulsion.name
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "db_security_group_id" {
  description = "ID of the security group for the RDS instance"
  value       = [module.aws_security_group.rds.id]
}