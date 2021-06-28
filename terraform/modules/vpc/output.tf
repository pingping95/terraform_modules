output "vpc" {
  value       = aws_vpc.my_vpc
  description = "Output details of my newly crated Vpc"
}

output "public_subnets" {
  value       = aws_subnet.my_public_subnets
  description = "Output details of my public subnet"
}

output "private_subnets" {
  value       = aws_subnet.my_private_subnets
  description = "Output details of my private subnet"
}

output "nat_eip" {
  value       = aws_eip.nat_eip
  description = "Output details of my private subnet"
}