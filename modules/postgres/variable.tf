locals {
  prefix   = "${var.bu}-${var.project}"
  suffix   = var.env
  region   = var.aws_region
  tags = {
    Businessunit = var.bu
    Environment  = var.env
    Managedby    = "Terraform"
  }
}

variable "vpc_id" {
  type = string
}

variable "db_name" {
  type        = string
  description = "db name"
}

variable "db_admin_user" {
  type        = string
  description = "db name "
}

variable "pg_engine_version" {
  type = string
}

variable "pg_family" {
  type = string
}

variable "pg_major_engine_version" {
  type = string
}

variable "pg_instance_class" {
  type = string
}

variable "pg_allocated_storage" {
  type = number
}

variable "pg_max_allocated_storage" {
  type = number
}


variable "pg_port" {
  type = number
}

variable "pg_multi_az" {
  type = bool
}

variable "pg_maintenance_window" {
  type = string
}

variable "pg_create_cloudwatch_log_group" {
  type = bool
}

variable "pg_skip_final_snapshot" {
  type = bool
}

variable "pg_deletion_protection" {
  type = bool
}

variable "pg_performance_insights_enabled" {
  type = bool
}

variable "pg_performance_insights_retention_period" {
  type = number
}

variable "pg_create_monitoring_role" {
  type = bool
}

variable "pg_monitoring_interval" {
  type    = number
}

variable "pg_monitoring_role_name" {
  type    = string
}

variable "pg_monitoring_role_use_name_prefix" {
  type    = bool
}

variable "vpc_cidr" {
  type = string
}

variable "bu" {
  type = string
}

variable "env" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "project" {
  type = string
}

variable "private_subnets" { 
}

variable "secretsmanager_name" {
    type = string
}