output "my_vpc" {
  value       = aws_vpc.my_vpc
  description = "Output details of my newly crated Vpc"
}

output "my_public_subnets" {
  value       = aws_subnet.my_public_subnets
  description = "Output details of my public subnet"
}

output "my_private_subnets" {
  value       = aws_subnet.my_private_subnets
  description = "Output details of my private subnet"
}

output "my_eip" {
  value       = aws_eip.nat_eip
  description = "Output details of my private subnet"
}