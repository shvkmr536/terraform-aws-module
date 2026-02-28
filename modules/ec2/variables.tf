variable "name" {
  description = "Name of EC2 instance"
  type        = string
}

variable "aws_region" {
  description = "AWS region to deploy resources into"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "ami_id" {
  default = "ami-0030e4319cbf4dbf2" 
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "env" {
  description = "Environment for the deployment"
  type        = string
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default     = {}
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "security_group_ids" {
  description = "List of security groups"
  type        = list(string)
}


