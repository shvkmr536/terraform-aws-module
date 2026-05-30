# terraform-aws-module
terrafrom aws module


# create the files when creating resource using module

---------------------------------------------------------------------------------------------------

# `backend.tf`

terraform {
  backend "s3" {
    bucket         = "terraform-demo-002"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

# `versions.tf`

```hcl
terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}
```






## `main.tf`

```hcl
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
  platform    = var.platform
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
```

## Variables

```hcl
variable "environment" {}
variable "vpc_cidr" {}
variable "azs" {}
variable "allocated_storage" {}
variable "storage_type" {}
variable "engine" {}
variable "engine_version" {}
variable "instance_class" {}
variable "db_name" {}
variable "username" {}
variable "password" {}
variable "platform" {}

variable "subnet_id" {}
variable "instance_type" {}
variable "os_type" {}
variable "ami_id" {}
variable "team" {}
variable "key_name" {}
```

## `terraform.tfvars`

```hcl
environment = "dev"
vpc_cidr    = "10.0.0.0/16"

azs = [
  "us-east-1a",
  "us-east-1b"
]

allocated_storage = 20
storage_type      = "gp2"
engine            = "mysql"
engine_version    = "8.0"
instance_class    = "db.t3.micro"
db_name           = "mydb"
username          = "admin"
password          = "password"
platform          = "payment"
os_type           = "linux"
team              = "platform_engineering"
ami_id            = "ami-091138d0f0d41ff90"
instance_type     = "t2.micro"
key_name          = "aws_mac_key"
```