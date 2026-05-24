output "instance_id" {
  description = "ID da instancia EC2"
  value       = aws_instance.app_server.id
}

output "public_ip" {
  description = "IP publico elastico da instancia"
  value       = aws_eip.app_eip.public_ip
}

output "app_url" {
  description = "URL de acesso a aplicacao"
  value       = "http://${aws_eip.app_eip.public_ip}:8080/api/hello"
}

output "security_group_id" {
  description = "ID do Security Group"
  value       = aws_security_group.app_sg.id
}
