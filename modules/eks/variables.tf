variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "environment" {
  description = "The environment for the EKS cluster"
  type        = string
  default     = "dev"
}

variable "private_subnets" {
  description = "The private subnets for the EKS cluster"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "cluster_role_arn" {
  description = "The ARN of the EKS cluster role"
  type        = string
}

variable "node_role_arn" {
  description = "The ARN of the EKS worker node role"
  type        = string
}

variable "cluster_policy_attachment" {
  description = "The policy attachment for the EKS cluster role"
  type        = string
}

variable "worker_policy_attachment" {
  description = "The policy attachment for the EKS worker node role"
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
