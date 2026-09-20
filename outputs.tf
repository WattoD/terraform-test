output "public_ip" {
  value = aws_instance.web.public_ip
}

output "url" {
  value = "http://${aws_instance.web.public_ip}"
}

output "subnet_ids" {
  description = "Map of subnet keys to subnet IDs"
  value       = module.network.subnet_ids
}
