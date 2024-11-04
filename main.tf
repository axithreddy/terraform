provider "aws" {
    region = "us-east-2"
}


variable vpc_cidr_block {}
variable subnet_cidr_block {}
variable availability_zone {}
variable env_prefix {}

resource "aws_vpc" "myapp-vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name: "${var.env_prefix}-vpc"
  }
}

resource "aws_subnet" "myapp-subnet-1" {
  vpc_id = aws_vpc.myapp-vpc.id
  cidr_block = var.subnet_cidr_block
  availability_zone = "us-east-2a"
  tags = {
    Name: "subnet-1-dev"
  }
}

# output "dev-vpc-id" {
#   value = aws_vpc.development-vpc.id
# }

# output "dev-subnet-id" {
#   value = aws_subnet.dev-subnet-1.id
# }

# data "aws_vpc" "existing-vpc" {
#   default = true
# }

# resource "aws_subnet" "dev-subnet-2" {
#   vpc_id = data.aws_vpc.existing-vpc.id
#   cidr_block = "172.31.48.0/20"
#   availability_zone = "us-east-2a"
#   tags = {
#     Name: "subnet-1-default"
#   }
# }