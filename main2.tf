# Configure the AWS Provider
provider "aws" {
  region = var.region-name
}

# VPC
resource "aws_vpc" "Main" {
  cidr_block       = var.cidr-block-vpc
  instance_tenancy = var.instance_tenancy
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support = var.enable_dns_support

  tags = { 
    Name = var.vpc_name
  }
}

#Public Subnet 1
resource "aws_subnet" "public_sub1" {
  vpc_id     = aws_vpc.Main.id
  cidr_block = var.cidr-block-for-public-subnet1
  availability_zone = var.availablilty-zone-public-subnet1

  tags = {
    Name = var.public_sub1_name
  }
}

#Public Subnet 2
resource "aws_subnet" "public_sub2" {
  vpc_id     = aws_vpc.Main.id
  cidr_block = var.cidr-block-for-public-subnet2
  availability_zone = var.availablilty-zone-public-subnet2

  tags = {
    Name = var.public_sub2_name
  }
}

#Private Subnet 1
resource "aws_subnet" "private_sub1" {
  vpc_id     = aws_vpc.Main.id
  cidr_block = var.cidr-block-for-private-subnet1
  availability_zone = var.availablilty-zone-private-subnet1

  tags = {
    Name = var.private_sub1_name
  }
}

#Private Subnet 2
resource "aws_subnet" "private_sub2" {
  vpc_id     = aws_vpc.Main.id
  cidr_block = var.cidr-block-for-private-subnet2
  availability_zone = var.availablilty-zone-private-subnet2

  tags = {
    Name = var.private_sub2_name
  }
}

#Public Route Table
resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.Main.id

  tags = {
    Name = var.public-route-table-name
  }
}

#Private Route Table
resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.Main.id

  tags = {
    Name = var.private-route-table-name
  }
}

#Route Association Public
resource "aws_route_table_association" "public-route-table-association-1" {
  subnet_id      = aws_subnet.public_sub1.id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "public-route-table-association-2" {
  subnet_id      = aws_subnet.public_sub2.id
  route_table_id = aws_route_table.public-route-table.id
}

# Route Association Private
resource "aws_route_table_association" "private-route-table-association-1" {
  subnet_id      = aws_subnet.private_sub1.id
  route_table_id = aws_route_table.private-route-table.id
}

resource "aws_route_table_association" "private-route-table-association-2" {
  subnet_id      = aws_subnet.private_sub2.id
  route_table_id = aws_route_table.private-route-table.id
}

#Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.Main.id

  tags = {
    Name = var.internet-gateway-name
  }
}

#Association of the internet gateway with the public route table/Route for Internet Gateway
resource "aws_route" "public-igw-route" {
  route_table_id            = aws_route_table.public-route-table.id
  gateway_id                = aws_internet_gateway.igw.id
  destination_cidr_block    = var.aws_route_destination_cidr_block

}

#Elastic IP
resource "aws_eip" "test_eip" {
  vpc                       = true
  associate_with_private_ip = var.elastic-ip-address

 tags = {
    Name = var.eip-name
  }
}
#NAT Gateway for Internet through the Public Subnet
  resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.test_eip.id
  subnet_id     = aws_subnet.public_sub1.id

 tags = {
    Name = var.nat-gateway-name
   }
 }

 # Route NAT GW with Private Route Table
resource "aws_route" "nat_gw_association_private_rt" {
  route_table_id         = aws_route_table.private-route-table.id
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id
  destination_cidr_block = var.aws_route_destination_cidr_block
}



