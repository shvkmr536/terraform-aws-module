resource "aws_db_instance" "default" {
  identifier = "${var.platform}-${var.environment}-${var.engine}-rds-001"
  allocated_storage = var.allocated_storage
  storage_type = var.storage_type
  engine         = var.engine
  engine_version = var.engine_version
  instance_class = var.instance_class
  db_name  = var.db_name
  username = var.username
  password = var.password
  db_subnet_group_name   = aws_db_subnet_group.rds.name
  vpc_security_group_ids = var.vpc_security_group_ids
  publicly_accessible = false # it should be set to false in production
  multi_az = false # it should be set to true in production
  skip_final_snapshot = true #it should be set to false in production
  deletion_protection = false
  tags = {
    Name          = "${var.platform}-${var.environment}-${var.engine}-rds-001"
    maintained_by = "terraform"
    team          = "platform-engineering"
  }
}

# RDS Subnet Group
resource "aws_db_subnet_group" "rds" {
  name       = "${var.environment}-rds-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.environment}-rds-subnet-group"
  }
}
