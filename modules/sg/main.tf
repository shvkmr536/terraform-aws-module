resource "aws_security_group" "rds" {
  name        = "${var.platform}-${var.environment}-rds-sg"
  description = "Security group for ${var.environment} environment"
  vpc_id     = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.environment}-rds-sg"
    maintained_by = "terraform"
    team = "platform-engineering"
  }
}

resource "aws_security_group" "web_server" {
  name        = "${var.environment}-web-sg"
  description = "Security group for ${var.environment} environment"
  vpc_id     = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.environment}-web-sg"
    maintained_by = "terraform"
    team = "platform-engineering"
  }
}