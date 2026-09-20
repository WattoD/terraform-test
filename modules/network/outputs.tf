output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The ID of the VPC"
}

output "subnet_ids" {
  value       = { for k, v in aws_subnet.net : k => v.id }
  description = "Map of subnet keys to subnet IDs"
}

output "igw_id" {
  value       = aws_internet_gateway.igw.id
  description = "The ID of the Internet Gateway"
}
