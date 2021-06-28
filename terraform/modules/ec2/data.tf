// Ubuntu 18.04 AMI ID
data "aws_ami" "ubuntu-18_04" {
    most_recent = true

    filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
    }

    owners = ["099720109477"]
}

// Amazon Linux2 AMI
data "aws_ami" "amazon_linux2" {
    most_recent = true
    owners = ["amazon"]

    filter {
        name = "name"
        values = ["amzn2-ami-hvm*"]
    }
}