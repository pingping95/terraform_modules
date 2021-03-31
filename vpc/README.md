# Custom VPC Module

## Usage Example
```
module "vpc" {
    source = /path/to/vp

    # Insert variables here
}

```


## Variables

vpc_cidr_block          Example: "10.0.0.0/16"
region                  Example: "ap-northeast-2"
prefix                  Example: "Dev"
public_subnet_cidr      Example: ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnet_cidr     Example: ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
public_az               Example: ["ap-northeast-2a", "ap-northeast-2c"]
private_az              Example: ["ap-northeast-2a", "ap-northeast-2c"]
define_eip              Example: true     




## Outputs

- VPC information.
- Public subnet information.
- Private subnet information.
- Elastic IP information.