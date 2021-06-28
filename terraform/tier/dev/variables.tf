variable "pub_instance_type" {
    type = string
    default = "t2.micro"
}

variable "pub_instance_name" {
    type = string
    default = "bastion"
}

variable "tier" {
    type = string
    default = "dev"
}

variable "subnet_ids" {
    type = list(string)
    default =  ["subnet-06f3d0519a562bd8c", "subnet-0f1e5c78ac8cce61c"]
}

variable "region" {
    type = string
    default = "ap-northeast-2"
}

variable "profile_name" {
    type = string
    default = "default"
}

variable "cred_file" {
    type = string
    default = "~/.aws/credentials"
}

variable "key_pair" {
    type = string
    default = "pingping95-key"
}

variable "sg_ids" {
    type = list(string)
    default = ["sg-0ef852d47b6388ceb"]
}