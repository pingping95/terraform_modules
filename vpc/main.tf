// VPC
resource "aws_vpc" "my_vpc" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "${var.prefix}-vpc"
    Environment = var.prefix
  }
}

// Public Subnets
resource "aws_subnet" "my_public_subnet" {
  count                   = length(var.public_subnet_cidr)
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.public_subnet_cidr[count.index]
  availability_zone       = var.public_az[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name        = "public-subnet-${count.index + 1}"
    Environment = var.prefix
  }
}

// Private Subnets
resource "aws_subnet" "my_private_subnet" {
  count                   = length(var.private_subnet_cidr)
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.private_subnet_cidr[count.index]
  availability_zone       = var.private_az[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name        = "private-subnet-${count.index + 1}"
    Environment = var.prefix
  }
}

// Internet Gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name        = "${var.prefix}-igw"
    Environment = var.prefix
  }
}

// Elastic IP
resource "aws_eip" "nat_eip" {
  vpc = var.define_eip
}

// NAT Gateway
resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.my_public_subnet[0].id
  depends_on    = [aws_internet_gateway.my_igw]
  tags = {
    "Name" = "${var.prefix}-nat_gw"
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
    Name        = "${var.prefix}-public_rt"
    Environment = var.prefix
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
    Name        = "${var.prefix}-private_rt"
    Environment = var.prefix
  }
}

// Route table associations
resource "aws_route_table_association" "public_rt_assoc" {
  count          = length(var.public_subnet_cidr)
  subnet_id      = element(aws_subnet.my_public_subnet.*.id, count.index)
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private_rt_assoc" {
  count          = length(var.private_subnet_cidr)
  subnet_id      = element(aws_subnet.my_private_subnet.*.id, count.index)
  route_table_id = aws_route_table.private_rt.id
}