# AWS EC2 Module

- terraform-aws-ec2-instance 공식 Module 입니다.

## Usage

```
module "ec2_cluster" {
  source                 = "../modules/ec2"
  version                = "~> 2.0"

  name                   = "my-cluster"
  instance_count         = 5

  ami                    = "ami-ebd02392"
  instance_type          = "t2.micro"
  key_name               = "hello-key"
  vpc_security_group_ids = ["sg-12345678"]
  subnet_id              = "subnet-eddcdzz4"

  tags = {
    Environment = "dev"
  }
}
```


## Ref

https://github.com/terraform-aws-modules/terraform-aws-ec2-instance