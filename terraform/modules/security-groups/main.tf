data "aws_vpc" "tf-vpc-project" {
  filter {
    name   = "tag:Name"
    values = ["tf-vpc-project"]
  }
}

data "http" "my_ip" {
  url = "https://api.ipify.org?format=json"
}

locals {
  my_ip = jsondecode(data.http.my_ip.body).ip
}

resource "aws_security_group" "public_1a" {
  name        = "public_1a-sg-ssh"
  description = "security groups for public 1a subnet"
  vpc_id      = data.aws_vpc.tf-vpc-project.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${local.my_ip}/32"]
  }

  #internet access for this subnet
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "public_1a-sg-ssh"
  }
}

resource "aws_security_group" "private_2a" {
  name        = "private_2a-sg-ssh"
  description = "security groups for subnet 2 private"
  vpc_id      = data.aws_vpc.tf-vpc-project.id

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.public_1a.id]
  }

  tags = {
    Name = "private_2a-sg-ssh"
  }
}

resource "aws_security_group" "private_3a" {
  name        = "private_3a-sg-ssh"
  description = "security group for subnet 3 private"
  vpc_id      = data.aws_vpc.tf-vpc-project.id

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.private_2a.id]
  }

  tags = {
    Name = "private_3a-sg-ssh"
  }
}