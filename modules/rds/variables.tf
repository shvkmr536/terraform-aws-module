variable "environment" {
  description = "The environment for which to create the database (e.g., 'dev', 'staging', 'prod')"
  type        = string
}

variable "allocated_storage" {
  description = "The amount of storage (in gigabytes) to allocate for the database"
  type        = number
  default     = 20
}

variable "storage_type" {
  description = "The storage type to use for the database (e.g., 'gp2', 'io1')"
  type        = string
  default     = "gp2"
}

variable "engine" {
  description = "The database engine to use (e.g., 'mysql', 'postgresql')"
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "The version of the database engine to use"
  type        = string
  default     = "8.0"
}

variable "instance_class" {
  description = "The instance class to use for the database"
  type        = string
  default     = "db.t2.micro"
}

variable "db_name" {
  description = "The name of the database to create"
  type        = string
  default     = "mydb"
}

variable "username" {
  description = "The username for the database"
  type        = string
  default     = "admin"
}

variable "password" {
  description = "The password for the database"
  type        = string
  default     = "password"
}

variable "vpc_security_group_ids" {
  description = "A list of VPC security group IDs to associate with the database"
  type        = list(string)
  default     = []    
}

variable "db_subnet_group_name" {
  description = "The name of the DB subnet group to use for the database"
  type        = string
  default     = ""  
}

variable "subnet_ids" {
  description = "A list of subnet IDs to associate with the database"
  type        = list(string)
  default     = []
}

variable "platform" {
  description = "The platform for which to create the database (e.g., 'payment', 'billing')"
  type        = string
}