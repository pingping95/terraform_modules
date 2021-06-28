variable "public_instance_count" {
    description = "Number of instance count"
    type = number
    default = 4
}

// Not default
variable "tier" {
    description = "Environment (TEST, DEV, STG, PRD)"
    type = string
}

// Not default
variable "public_instance_type" {
    description = "Public Instance type"
    type = string
}

variable "iam_instance_profile" {
    description = "iam role for ec2 instance"
    type = string
    default = ""
}

variable "user_data" {
    description = "The user data to provide when launching the instance."
    type = string
    default = ""
}

// Not default
variable "public_instance_name" {
    description = "Public instance name"
    type = string
}

// Not default
variable "subnet_ids" {
    description = "A list of VPC Subnet IDs to launch in"
    type = list(string)
    default = []
}

variable "key_name" {
    description = "keypair name"
    type = string
}

variable "security_group_ids" {
    description = "Security Group IDs"
    type = list(string)
}