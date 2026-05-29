resource "aws_instance" "main" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = var.security_group_ids
  key_name = var.key_name
  subnet_id = var.subnet_id
  tags = {
    Name        = "${var.platform}-${var.environment}-ec2-${var.os_type}"
    Environment = var.environment
    ManagedBy   = "Terraform"
    team        = var.team

  }
}