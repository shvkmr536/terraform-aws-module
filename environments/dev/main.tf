provider "aws" {
  region = "us-east-1"
}

terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

module "vpc" {
  source = "../../modules/vpc"

  environment = var.environment
  vpc_cidr    = "10.0.0.0/16"

  azs = var.azs
}

module "sg" {
  source = "../../modules/sg"

  environment = var.environment
  vpc_id      = module.vpc.vpc_id
}

module "ec2" {
  source = "../../modules/ec2"

  environment        = var.environment
  instance_type      = var.instance_type
  ami_id             = var.ami_id
  security_group_ids = [module.sg.web_sg]
  subnet_id          = module.vpc.public_subnet_ids[0]
  os_type            = var.os_type
  platform           = var.platform
  team               = var.team
  key_name           = var.key_name

}

module "rds" {
  source            = "../../modules/rds"
  environment       = var.environment
  db_name           = var.db_name
  username          = var.username
  password          = var.password
  allocated_storage = var.allocated_storage
  storage_type      = var.storage_type
  engine            = var.engine
  engine_version    = var.engine_version
  instance_class    = var.instance_class
  #subnet_ids        = module.vpc.private_subnet_ids #use if dont want to access publicly
  subnet_ids = module.vpc.public_subnet_ids #use if want to access publicly
  platform   = var.platform
  vpc_security_group_ids = [
    module.sg.rds_sg
  ]
}