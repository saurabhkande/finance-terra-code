# Redshift Cluster

resource "aws_redshift_cluster" "chola_redshift" {
  cluster_identifier        = var.cluster_identifier
  database_name             = var.database_name
  master_username           = var.master_username
  master_password           = var.master_password
  node_type                 = var.node_type
  cluster_type              = var.cluster_type
  cluster_subnet_group_name = aws_redshift_subnet_group.redshift_subnet_group.id
  skip_final_snapshot       = true
  iam_roles                 = [aws_iam_role.redshift_role.arn]

  depends_on = [
    aws_redshift_subnet_group.redshift_subnet_group,
    aws_iam_role.redshift_role
  ]
}

# IAM Role for Redshift

resource "aws_iam_role" "redshift_role" {
  name               = "chola_redshift_role"
  assume_role_policy = data.aws_iam_policy_document.redshift_assume_role_policy.json

  tags = {
    Name = "redshift-role"
  }
}

# IAM Role Policy for S3 Full Access

resource "aws_iam_role_policy" "s3_full_access_policy" {
  name   = "choa_redshift_s3_policy"
  role   = aws_iam_role.redshift_role.id
  policy = data.aws_iam_policy_document.redshift_s3_policy.json
}

# Redshift Subnet Group

resource "aws_redshift_subnet_group" "redshift_subnet_group" {
  name       = "redshift-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    environment = "dev"
    Name        = "redshift-subnet-group"
  }
}

# Data source for IAM assume role policy document

data "aws_iam_policy_document" "redshift_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["redshift.amazonaws.com"]
    }
  }
}

# Data source for IAM role policy document for S3 full access

data "aws_iam_policy_document" "redshift_s3_policy" {
  statement {
    effect = "Allow"

    actions   = ["s3:*"]
    resources = ["*"]
  }
}
