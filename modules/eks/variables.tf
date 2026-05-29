variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "environment" {
  description = "The environment for the EKS cluster"
  type        = string
}

variable "platform" {
  description = "The platform for the EKS cluster"
  type        = string
}

variable "team" {
  description = "The team responsible for the EKS cluster"
  type        = string
}
