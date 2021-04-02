// VPC
resource "aws_vpc" "my_vpc" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "${var.Environment}-vpc"
    Environment = var.Environment
  }
}

// Public Subnets
resource "aws_subnet" "my_public_subnets" {
  count                   = length(var.public_subnet_cidr)
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.public_subnet_cidr[count.index]
  availability_zone       = var.available_azs[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.Environment}-public-subnet-${count.index + 1}"
    Environment = var.Environment
  }
}

// Private Subnets
resource "aws_subnet" "my_private_subnets" {
  count                   = length(var.private_subnet_cidr)
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.private_subnet_cidr[count.index]
  availability_zone       = var.available_azs[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name        = "${var.Environment}-private-subnet-${count.index + 1}"
    Environment = var.Environment
  }
}

// Internet Gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name        = "${var.Environment}-igw"
    Environment = var.Environment
  }
}

// Elastic IP
resource "aws_eip" "nat_eip" {
  vpc = var.define_eip
}

// NAT Gateway
resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.my_public_subnets[0].id
  depends_on    = [aws_internet_gateway.my_igw]
  tags = {
    "Name" = "${var.Environment}-nat_gw"
  }
}

// public Route table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name        = "${var.Environment}-public_rt"
    Environment = var.Environment
  }
}

// private Route table
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-gw.id
  }

  tags = {
    Name        = "${var.Environment}-private_rt"
    Environment = var.Environment
  }
}

// Route table associations
resource "aws_route_table_association" "public_rt_assoc" {
  count          = length(var.public_subnet_cidr)
  subnet_id      = element(aws_subnet.my_public_subnets.*.id, count.index)
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private_rt_assoc" {
  count          = length(var.private_subnet_cidr)
  subnet_id      = element(aws_subnet.my_private_subnets.*.id, count.index)
  route_table_id = aws_route_table.private_rt.id
}