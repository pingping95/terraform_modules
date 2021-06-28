variable "vpc_cidr_block" {
  type        = string
  description = "The CIDR block for the VPC."
  default     = "10.0.0.0/16"
}

variable "Environment" {
  type        = string
  description = "Environment for resource tags."
  default     = "dev"
}

variable "public_subnet_cidr" {
  description = "Subnet CIDRs for public subnets (length must match configured availability_zones)"
  type        = list(any)
  default     = ["10.0.0.1/24, 10.0.0.2/24"]
}

variable "private_subnet_cidr" {
  description = "Subnet CIDRs for private subnets (length must match configured availability_zones)"
  type        = list(any)
  default     = ["10.0.0.11/24, 10.0.0.12/24"]
}

variable "available_azs" {
  type        = list(string)
  description = "Availibility zones"
}

variable "define_eip" {
  type        = bool
  description = "Set elastic ip. 'true' or 'false'."
  default     = true
}