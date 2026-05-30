variable "environment" {
  description = "The environment for the EKS cluster"
  type        = string
}

variable "platform" {
  description = "The platform for the EKS cluster"
  type        = string
}

variable "private_subnets" {
  description = "The team responsible for the EKS cluster"
  type        = list(string)
}

variable "team" {
  description = "The team responsible for the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "EKS cluster version"
  type        = string
}


