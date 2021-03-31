variable "region" {
  type        = string
  description = "Region for the aws resources."
}

variable "vpc_cidr_block" {
  type        = string
  description = "The CIDR block for the VPC."
}

variable "prefix" {
  type        = string
  description = "Prefix for resource tags."
}

variable "public_subnet_cidr" {
  description = "Subnet CIDRs for public subnets (length must match configured availability_zones)"
  type        = list(any)
}

variable "private_subnet_cidr" {
  description = "Subnet CIDRs for private subnets (length must match configured availability_zones)"
  type        = list(any)
}

variable "public_az" {
  type        = list(string)
  description = "Availibility zones for the public subnets."
}

variable "private_az" {
  type        = list(string)
  description = "Availibility zones for the private subnets."
}

variable "define_eip" {
  type        = bool
  description = "Set elastic ip. 'true' or 'false'."
}