data "aws_subnet" "public1a" {
  filter {
    name   = "tag:Name"
    values = ["Public1A"]
  }
}

data "aws_subnet" "private2a" {
  filter {
    name   = "tag:Name"
    values = ["Private2A"]
  }
}

data "aws_subnet" "private3a" {
  filter {
    name   = "tag:Name"
    values = ["Private3A"]
  }
}

data "aws_security_group" "public_1a" {
  filter {
    name   = "tag:Name"
    values = ["public_1a-sg-ssh"]
  }
}

data "aws_security_group" "private_2a" {
  filter {
    name   = "tag:Name"
    values = ["private_2a-sg-ssh"]
  }
}

data "aws_security_group" "private_3a" {
  filter {
    name   = "tag:Name"
    values = ["private_3a-sg-ssh"]
  }
}
///////
resource "aws_instance" "public1a" {
  ami                    = var.ami
  instance_type          = "t2.micro"
  subnet_id              = data.aws_subnet.public1a.id
  vpc_security_group_ids = [data.aws_security_group.public_1a.id]
  key_name               = "terraform"
  tags = {
    Name = "web_public1a"
  }
}

resource "aws_instance" "private2a" {
  ami                    = var.ami
  instance_type          = "t2.micro"
  subnet_id              = data.aws_subnet.private2a.id
  vpc_security_group_ids = [data.aws_security_group.private_2a.id]
  key_name               = "terraform"
  tags = {
    Name = "app_private2a"
  }
}

resource "aws_instance" "private3a" {
  ami                    = var.ami
  instance_type          = "t2.micro"
  subnet_id              = data.aws_subnet.private3a.id
  vpc_security_group_ids = [data.aws_security_group.private_3a.id]
  key_name               = "terraform"
  tags = {
    Name = "data_private3a"
  }
}