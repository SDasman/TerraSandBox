variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
}

variable "ec2_key_name" {
  description = "Name of the existing EC2 Key Pair for SSH access"
  type        = string
}

variable "env" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string
}

