variable "region-name" {
    description = "name of region"
    default = "eu-west-2"
    type = string
}

variable "vpc_name" {
    description = "name of vpc"
    default = "Prod-rock-VPC"
    type = string
}

variable "cidr-block-vpc" {
    description = "making cidr block for vpc a variable"
    default = "100.0.0.0/16"
    type = string
}

variable "instance_tenancy" {
    description = "making instance tenancy a variable"
    default = "default"
    type = string
}

variable "enable_dns_hostnames" {
    description = "making enable dns hostnames a variable"
    default = "true"
    type = string
}

variable "enable_dns_support" {
    description = "making enable dns support a variable"
    default = "true"
    type = string
}

variable "cidr-block-for-public-subnet1" {
    description = "making cidr for public subnet1 a variable"
    default = "100.0.0.0/19"
    type = string
}

variable "availablilty-zone-public-subnet1" {
    description = "making availability zone for public subnet1 a variable"
    default = "eu-west-2a"
    type = string
}

variable "public_sub1_name" {
    description = "name of public subnet1"
    default = "Test-public -sub1"
    type = string
}

variable "cidr-block-for-public-subnet2" {
    description = "making cidr for public subnet2 a variable"
    default = "100.0.32.0/19"
    type = string
}

variable "availablilty-zone-public-subnet2" {
    description = "making availability zone for public subnet2 a variable"
    default = "eu-west-2a"
    type = string
}

variable "public_sub2_name" {
    description = "name of public subnet2"
    default = "Test-public -sub2"
    type = string
}

variable "cidr-block-for-private-subnet1" {
    description = "making cidr for private subnet1 a variable"
    default = "100.0.64.0/18"
    type = string
}

variable "availablilty-zone-private-subnet1" {
    description = "making availability zone for private subnet1 a variable"
    default = "eu-west-2a"
    type = string
}

variable "private_sub1_name" {
    description = "name of private subnet1"
    default = "Test-priv-sub1"
    type = string
}

variable "cidr-block-for-private-subnet2" {
    description = "making cidr for private subnet2 a variable"
    default = "100.0.128.0/17"
    type = string
}

variable "availablilty-zone-private-subnet2" {
    description = "making availability zone for private subnet2 a variable"
    default = "eu-west-2a"
    type = string
}

variable "private_sub2_name" {
    description = "name of private subnet2"
    default = "Test-priv-sub2"
    type = string
}

variable "public-route-table-name" {
    description = "name of public route table"
    default = "Test-pub-route-table"
    type = string
}

variable "private-route-table-name" {
    description = "name of private route table"
    default = "Test-pri-route-table"
    type = string
}

variable "internet-gateway-name" {
    description = "name of internet gateway"
    default = "Test-igw"
    type = string
}

variable "aws_route_destination_cidr_block" {
    description = "making aws route destination cidr block for igw & nat as a variable"
    default = "0.0.0.0/0"
    type = string
}

variable "internet-gateway-association" {
    description = "name of internet gateway association public route table"
    default = "Test-igw-association"
    type = string
}

variable "elastic-ip-address" {
    description = "elastic ip address associated with private ip"
    default = "100.0.64.7"
    type = string
}

variable "eip-name" {
    description = "making elastic ip address name a variable"
    default = "test_eip"
    type = string
}

variable "nat-gateway-name" {
    description = "making name of nat gateway a variable"
    default = "Test-Nat-gateway"
    type = string
}

variable "sec_group_name" {
    description = "making name of security group name a variable"
    default = "Test-sec-group"
    type = string
}

variable "ingress_allow_http_80" {
    description = "making port for allowing all traffic a variable"
    default = "80"
    type = string
}

variable "ingress_allow_ssh_22" {
    description = "making port for ingress allowing ssh a variable"
    default = "22"
    type = string
}

variable "protocol_tcp" {
    description = "making protocol for ingress a variable"
    default = "tcp"
    type = string
}

variable "protocol_1" {
    description = "making protocol for egress a variable"
    default = "-1"
    type = string
}

variable "cidr_blocks_ingress" {
    description = "making cidr blocks for ingress a variable"
    default = ["0.0.0.0/0"]
    type = list
}

variable "cidr_blocks_egress" {
    description = "making cidr blocks for egress a variable"
    default = ["0.0.0.0/0"]
    type = list
}

variable "port_egress" {
    description = "making port for egress a variable"
    default = "0"
    type = string
}

variable "ami" {
    description = "making ami a variable"
    default = "ami-05a8c865b4de3b127"
    type = string
}

variable "instance_type" {
    description = "making instance type a variable"
    default = "t2.micro"
    type = string
}

variable "key_name" {
    description = "making key name a variable"
    default = "Manna"
    type = string
}

variable "associate_public_ip_address" {
    description = "making associate public ip address a variable"
    default = "true"
    type = string
}

variable "instance_name" {
    description = "making instance name a variable"
    default = "Test-server1"
    type = string
}

variable "instance_name2" {
    description = "making instance name a variable"
    default = "Test-server2"
    type = string
}

variable "iam_role" {
    description = "making iam role name a variable"
    default = "test_role"
    type = string
}

variable "iam_role_policy" {
    description = "making iam role policy name a variable"
    default = "test_policy"
    type = string
}

variable "iam_instance_profile" {
    description = "making iam instance profile name a variable"
    default = "test_profile"
    type = string
}

variable "instance_name3" {
    description = "making basting host instance name a variable"
    default = "basting_host_server"
    type = string
}

variable "cidr_blocks_ingress_private_subnets" {
    description = "making cidr blocks for ingress a variable"
    default = ["0.0.0.0/0"]
    type = list
}


variable "sec_group_name2" {
    description = "making name of security group2 name a variable"
    default = "Test-sec-basting-guest"
    type = string
}
