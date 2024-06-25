
module "db" {
 
  source                                = "terraform-aws-modules/rds/aws"
  version                               = "~> 5.0"
  identifier                            = var.db_name
  engine                                = "postgres"
  engine_version                        = var.pg_engine_version
  family                                = var.pg_family              
  major_engine_version                  = var.pg_major_engine_version
  instance_class                        = var.pg_instance_class
  allocated_storage                     = var.pg_allocated_storage
  max_allocated_storage                 = var.pg_max_allocated_storage
  db_name                               = var.db_name
  username                              = var.db_admin_user
  create_random_password                = false
  password                              = module.secrets.postgres_secret_string
  port                                  = var.pg_port
  multi_az                              = var.pg_multi_az
  db_subnet_group_name                  = module.subnet_group.db_subnet_group_name
  vpc_security_group_ids                = [module.security_group.security_group_id]
  maintenance_window                    = var.pg_maintenance_window
  # backup_window                         = var.pg_backup_window
  enabled_cloudwatch_logs_exports       = ["postgresql", "upgrade"]
  create_cloudwatch_log_group           = var.pg_create_cloudwatch_log_group
  # backup_retention_period               = var.pg_backup_retention_period
  skip_final_snapshot                   = var.pg_skip_final_snapshot
  deletion_protection                   = var.pg_deletion_protection
  performance_insights_enabled          = var.pg_performance_insights_enabled
  performance_insights_retention_period = var.pg_performance_insights_retention_period
  create_monitoring_role                = var.pg_create_monitoring_role
  monitoring_interval                   = var.pg_monitoring_interval
  monitoring_role_name                  = var.pg_monitoring_role_name
  monitoring_role_use_name_prefix       = var.pg_monitoring_role_use_name_prefix
  monitoring_role_description           = "SKPD_DB_MODEL_ROLE"
  parameters = [
    {
      name  = "autovacuum"
      value = 1
    },
    {
      name  = "client_encoding"
      value = "utf8"
    }
  ]
 
  tags = local.tags
}
 
 
# # PostgreSQL RDS security group
 
# module "security_group" {
 
#   source      = "terraform-aws-modules/security-group/aws"
#   version     = "~> 5.0"
#   name        = format("%s-%s-%s", local.prefix, "rds-sg-2", local.suffix)
#   description = "Complete PostgreSQL Security group"
#   vpc_id      = var.vpc_id
 
#   ingress_with_cidr_blocks = [
#     {
#       from_port   = 5432
#       to_port     = 5432
#       protocol    = "tcp"
#       description = "PostgreSQL access from within VPC"
#       cidr_blocks = var.vpc_cidr
#     },
#   ]
#   tags = local.tags
# }

resource "aws_db_subnet_group" "db-sub-grp" {
  name       = "subnet-grp-minfy"
  subnet_ids = var.private_subnets

  tags = {
    Name = "Chola demo subnet group"
  }
}

