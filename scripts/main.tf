provider "aws" {
  region = var.region
}
resource "aws_s3_bucket" "stg-infra-s3" {
   bucket = "stg-infra-s3" 
}
resource "aws_vpc" "STG_VPC" {
  cidr_block = var.stg_cidr
}
resource "aws_subnet" "pub_subnet1" {
  vpc_id = aws_vpc.STG_VPC.id
  availability_zone = "us-east-1a"
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "pub_subnet1"
    }
  }
  resource "aws_subnet" "pub_subnet2" {
  vpc_id = aws_vpc.STG_VPC.id
  availability_zone = "us-east-1b"
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "pub_subnet2"
    }
  }
  resource "aws_subnet" "prv_subnet1" {
    vpc_id = aws_vpc.STG_VPC.id
    availability_zone = "us-east-1c"
    cidr_block = "10.0.3.0/24"
    map_public_ip_on_launch = false
    tags = {
      Name = "prv_subnet1"
      }
  }
  resource "aws_subnet" "prv_subnet2" {
    vpc_id = aws_vpc.STG_VPC.id
    availability_zone = "us-east-1d"
    cidr_block = "10.0.4.0/24"
    map_public_ip_on_launch = false
    tags = {
      Name = "prv_subnet2"
      }
  }
  resource "aws_route_table" "pub_RT" {
    vpc_id = aws_vpc.STG_VPC.id

    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.my_igw.id
      }
  }
  resource "aws_route_table" "prv_RT" {
    vpc_id = aws_vpc.STG_VPC.id 
  }
  resource "aws_internet_gateway" "my_igw" {
    vpc_id = aws_vpc.STG_VPC.id
  }

  resource "aws_route_table_association" "pub_RTAS" {
    route_table_id = aws_route_table.pub_RT.id
    subnet_id = aws_subnet.pub_subnet1.id
  }

  resource "aws_route_table_association" "prv_RTAS" {
    route_table_id = aws_route_table.prv_RT.id
    subnet_id = aws_subnet.prv_subnet1.id
  }
