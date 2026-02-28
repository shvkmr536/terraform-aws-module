output "instance_id" {
  value = aws_instance.demo.id
}
output "instance_name" {
  value = aws_instance.demo.tags["Name"]
}

output "public_ip" {
  value = aws_instance.demo.public_ip
}