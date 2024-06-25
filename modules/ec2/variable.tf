variable "instance_count" {
  description = "Number of EC2 instances"
  type        = number
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
}

variable "key_name" {
  description = "Key pair name for the EC2 instances"
  type        = string
}

variable "sg_id" {
  description = "security group for windows ec2 instance"
}

variable "subnet_id" {
    description = "subnet where your windows ec2 will be placed"
}