//in eu-central-1 there are 3 availability zone a-b-c
resource "aws_subnet" "subnet1" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_cidr.default["Public1A"]
  availability_zone       = "eu-central-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet-1a"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_cidr.default["Public1B"]
  availability_zone       = "eu-central-1b"
  map_public_ip_on_launch = false
  tags = {
    Name = "subnet-1b"
  }
  
}

resource "aws_subnet" "subnet3" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_cidr.default["Public1C"]
  availability_zone       = "eu-central-1c"
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet-1c"
  }
}

