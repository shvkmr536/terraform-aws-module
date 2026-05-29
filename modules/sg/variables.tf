variable "environment" {
  description = "The environment for the resources"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID where the security groups will be created"
  type        = string
}

variable "platform" {
  description = "The platform for the resources"
  type        = string  
}
