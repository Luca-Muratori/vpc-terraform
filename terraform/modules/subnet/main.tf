//in eu-central-1 there are 3 availability zone a-b-c
data "aws_vpc" "tf-vpc-project" {
  filter {
    name   = "tag:Name"
    values = ["tf-vpc-project"]
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id                  = data.aws_vpc.tf-vpc-project.id
  cidr_block              = var.subnet_cidr["Public1A"].cidr_block
  availability_zone       = "eu-central-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet-1a"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id                  = data.aws_vpc.tf-vpc-project.id
  cidr_block              = var.subnet_cidr["Public1B"].cidr_block
  availability_zone       = "eu-central-1b"
  map_public_ip_on_launch = false
  tags = {
    Name = "subnet-1b"
  }
}

resource "aws_subnet" "subnet3" {
  vpc_id                  = data.aws_vpc.tf-vpc-project.id
  cidr_block              = var.subnet_cidr["Public1C"].cidr_block
  availability_zone       = "eu-central-1c"
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet-1c"
  }
}