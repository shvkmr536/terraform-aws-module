output "web_sg" {
  value = aws_security_group.web_server.id
}

output "rds_sg" {
  value = aws_security_group.rds.id
}