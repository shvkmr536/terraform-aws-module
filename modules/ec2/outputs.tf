output "instance_id" {
  value = aws_instance.main.id
}
output "instance_name" {
  value = aws_instance.main.tags["Name"]
}

output "public_ip" {
  value = aws_instance.main.public_ip
}