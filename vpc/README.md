# Custom VPC Module
- 간단하게 Test할 때 빠르게 AWS Infra를 배포하기 위해 생성한 Custom VPC Module입니다.



## 1. Usage Example
간략한 모듈 사용 방법입니다.

```
module "vpc" {
    source = "../modules/vpc"
    region = "ap-northeast-2"
    vpc_cidr_block = "10.0.0.0/16"
    prefix = "test"
    public_subnet_cidr = ["10.0.1.0/24", "10.0.2.0/24"]
    private_subnet_cidr = ["10.0.10.0/24", "10.0.11.0/24"]
    public_az = ["ap-northeast-2a", "ap-northeast-2c"]
    private_az = ["ap-northeast-2a", "ap-northeast-2c"]
    define_eip = true
}

```


## Variables
변수 리스트입니다.

```
vpc_cidr_block          Example: "10.0.0.0/16"
region                  Example: "ap-northeast-2"
prefix                  Example: "Dev"
public_subnet_cidr      Example: ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnet_cidr     Example: ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
public_az               Example: ["ap-northeast-2a", "ap-northeast-2c"]
private_az              Example: ["ap-northeast-2a", "ap-northeast-2c"]
define_eip              Example: true

```


## Outputs
Output 리스트입니다.

- VPC information
- Public subnet information
- Private subnet information
- Elastic IP information% 