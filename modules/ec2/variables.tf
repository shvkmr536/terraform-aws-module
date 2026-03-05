/*variable "name" {
  description = "Name of EC2 instance"
  type        = string
}

#variable "subnet_id" {
#  description = "Subnet ID"
#  type        = string
#}

#variable "security_group_ids" {
#  description = "List of security groups"
#  type        = list(string)
#}*/

variable "aws_region" {
  description = "AWS region to deploy resources into"
  type        = string
}

variable "instance_type" {
  description = "EC2 iyesnstance type"
  type        = string
}

variable "ami_id" {
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


