//in eu-central-1 there are 3 availability zone a-b-c
data "aws_vpc" "tf-vpc-project" {
  filter {
    name   = "tag:Name"
    values = ["tf-vpc-project"]
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id                  = data.aws_vpc.tf-vpc-project.id
  cidr_block              = var.subnet_cidr[0].cidr
  availability_zone       = var.subnet_cidr[0].az
  map_public_ip_on_launch = var.subnet_cidr[0].public_ip
  tags = {
    Name = var.subnet_cidr[0].name
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id                  = data.aws_vpc.tf-vpc-project.id
  cidr_block              = var.subnet_cidr[1].cidr
  availability_zone       = var.subnet_cidr[1].az
  map_public_ip_on_launch = var.subnet_cidr[1].public_ip
  tags = {
    Name = var.subnet_cidr[1].name
  }
}

resource "aws_subnet" "subnet3" {
  vpc_id                  = data.aws_vpc.tf-vpc-project.id
  cidr_block              = var.subnet_cidr[2].cidr
  availability_zone       = var.subnet_cidr[2].az
  map_public_ip_on_launch = var.subnet_cidr[2].public_ip
  tags = {
    Name = var.subnet_cidr[2].name
  }
}