variable "subnet_id" {
  description = "Subnet ID public or private"
  type        = string
}

variable "security_group_ids" {
  description = "List of security groups"
  type       = list(string)
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default     = {}
}

variable "environment" {
  description = "The environment for the resources"
  type        = string
}

variable "platform" {
  description = "The platform for the resources"
  type        = string
}

variable "os_type" {
  description = "The operating system type for the EC2 instance (e.g., 'linux', 'windows')"
  type        = string
}

variable "team" {
  description = "The team responsible for the resources"
  type        = string
}

variable "key_name" {
  description = "The key name for the EC2 instance"
  type        = string
}
