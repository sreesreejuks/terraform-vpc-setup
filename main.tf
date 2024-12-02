provider "aws" {
    region = "us-east-1"
  
}

resource "aws_vpc" "a4l-vpc1" {
  cidr_block = "10.16.0.0/16"
  assign_generated_ipv6_cidr_block = true
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "a4l-vpc1"
    Environment = "Production"
  }
}

resource "aws_internet_gateway" "a4l-vpc1-igw" {
  vpc_id = aws_vpc.a4l-vpc1.id

  tags = {
    Name = "a4l-vpc1-igw"
  }
}

resource "aws_route_table" "a4l-vpc1-rt-web" {
  vpc_id = aws_vpc.a4l-vpc1.id

  # IPv4 route
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.a4l-vpc1-igw.id
  }
  
  # IPv6 route
  route {
    ipv6_cidr_block = "::/0"
    gateway_id = aws_internet_gateway.a4l-vpc1-igw.id
  }

  tags = {
        Name = "a4l-vpc1-rt-web"
  }
}

resource "aws_route_table_association" "a4l-vpc1-rt-web-A" {
  subnet_id      = aws_subnet.sn-web-A.id
  route_table_id = aws_route_table.a4l-vpc1-rt-web.id
}

resource "aws_route_table_association" "a4l-vpc1-rt-web-B" {
  subnet_id      = aws_subnet.sn-web-B.id
  route_table_id = aws_route_table.a4l-vpc1-rt-web.id
}

resource "aws_route_table_association" "a4l-vpc1-rt-web-C" {
  subnet_id      = aws_subnet.sn-web-C.id
  route_table_id = aws_route_table.a4l-vpc1-rt-web.id
}

resource "aws_subnet" "sn-reserved-A" {
  vpc_id     = aws_vpc.a4l-vpc1.id
  cidr_block = "10.16.0.0/20"
  ipv6_cidr_block = cidrsubnet(aws_vpc.a4l-vpc1.ipv6_cidr_block, 8, 0)
  availability_zone = "us-east-1a"
  assign_ipv6_address_on_creation = true

  tags = {
    Name = "sn-reserved-A"
  }
}

resource "aws_subnet" "sn-reserved-B" {
  vpc_id     = aws_vpc.a4l-vpc1.id
  cidr_block = "10.16.64.0/20"
  ipv6_cidr_block = cidrsubnet(aws_vpc.a4l-vpc1.ipv6_cidr_block, 8, 4)
  availability_zone = "us-east-1b"
  assign_ipv6_address_on_creation = true

  tags = {
    Name = "sn-reserved-B"
  }
}

resource "aws_subnet" "sn-reserved-C" {
  vpc_id     = aws_vpc.a4l-vpc1.id
  cidr_block = "10.16.128.0/20"
  ipv6_cidr_block = cidrsubnet(aws_vpc.a4l-vpc1.ipv6_cidr_block, 8, 8)
  availability_zone = "us-east-1c"
  assign_ipv6_address_on_creation = true

  tags = {
    Name = "sn-reserved-C"
  }
}

resource "aws_subnet" "sn-db-A" {
  vpc_id     = aws_vpc.a4l-vpc1.id
  cidr_block = "10.16.16.0/20"
  ipv6_cidr_block = cidrsubnet(aws_vpc.a4l-vpc1.ipv6_cidr_block, 8, 1)
  availability_zone = "us-east-1a"
  assign_ipv6_address_on_creation = true

  tags = {
    Name = "sn-db-A"
  }
}

resource "aws_subnet" "sn-db-B" {
  vpc_id     = aws_vpc.a4l-vpc1.id
  cidr_block = "10.16.80.0/20"
  ipv6_cidr_block = cidrsubnet(aws_vpc.a4l-vpc1.ipv6_cidr_block, 8, 5)
  availability_zone = "us-east-1b"
  assign_ipv6_address_on_creation = true

  tags = {
    Name = "sn-db-B"
  }
}

resource "aws_subnet" "sn-db-c" {
  vpc_id     = aws_vpc.a4l-vpc1.id
  cidr_block = "10.16.144.0/20"
  ipv6_cidr_block = cidrsubnet(aws_vpc.a4l-vpc1.ipv6_cidr_block, 8, 9)
  availability_zone = "us-east-1c"
  assign_ipv6_address_on_creation = true

  tags = {
    Name = "sn-db-C"
  }
}

resource "aws_subnet" "sn-app-A" {
  vpc_id     = aws_vpc.a4l-vpc1.id
  cidr_block = "10.16.32.0/20"
  ipv6_cidr_block = cidrsubnet(aws_vpc.a4l-vpc1.ipv6_cidr_block, 8, 2)
  availability_zone = "us-east-1a"
  assign_ipv6_address_on_creation = true

  tags = {
    Name = "sn-app-A"
  }
}

resource "aws_subnet" "sn-app-B" {
  vpc_id     = aws_vpc.a4l-vpc1.id
  cidr_block = "10.16.96.0/20"
  ipv6_cidr_block = cidrsubnet(aws_vpc.a4l-vpc1.ipv6_cidr_block, 8, 6)
  availability_zone = "us-east-1b"
  assign_ipv6_address_on_creation = true

  tags = {
    Name = "sn-app-B"
  }
}

resource "aws_subnet" "sn-app-C" {
  vpc_id     = aws_vpc.a4l-vpc1.id
  cidr_block = "10.16.160.0/20"
  ipv6_cidr_block = cidrsubnet(aws_vpc.a4l-vpc1.ipv6_cidr_block, 8, 10)
  availability_zone = "us-east-1c"
  assign_ipv6_address_on_creation = true

  tags = {
    Name = "sn-app-C"
  }
}

resource "aws_subnet" "sn-web-A" {
  vpc_id     = aws_vpc.a4l-vpc1.id
  cidr_block = "10.16.48.0/20"
  ipv6_cidr_block = cidrsubnet(aws_vpc.a4l-vpc1.ipv6_cidr_block, 8, 3)
  availability_zone = "us-east-1a"
  assign_ipv6_address_on_creation = true
  map_public_ip_on_launch = true

  tags = {
    Name = "sn-web-A"
  }
}

resource "aws_subnet" "sn-web-B" {
  vpc_id     = aws_vpc.a4l-vpc1.id
  cidr_block = "10.16.112.0/20"
  ipv6_cidr_block = cidrsubnet(aws_vpc.a4l-vpc1.ipv6_cidr_block, 8, 7)
  availability_zone = "us-east-1b"
  assign_ipv6_address_on_creation = true
  map_public_ip_on_launch = true

  tags = {
    Name = "sn-web-B"
  }
}

resource "aws_subnet" "sn-web-C" {
  vpc_id     = aws_vpc.a4l-vpc1.id
  cidr_block = "10.16.176.0/20"
  ipv6_cidr_block = cidrsubnet(aws_vpc.a4l-vpc1.ipv6_cidr_block, 8, 11)
  availability_zone = "us-east-1c"
  assign_ipv6_address_on_creation = true
  map_public_ip_on_launch = true

  tags = {
    Name = "sn-web-C"
  }
}
