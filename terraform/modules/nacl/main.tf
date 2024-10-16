//look claude  'creating three route tables in terraform' last messages
data "aws_vpc" "tf-vpc-project" {
  filter {
    name   = "tag:Name"
    values = ["tf-vpc-project"]
  }
}

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

data "http" "my_ip" {
  url = "https://api.ipify.org?format=json" 
}

locals {
  my_ip=jsondecode(data.http.my_ip.body).ip
}


resource "aws_network_acl" "public1a" {
  vpc_id = data.aws_vpc.tf-vpc-project.id
  subnet_ids = [ data.aws_subnet.public1a.id ]

  ingress {
    protocol="tcp"
    rule_no=100
    action="allow"
    cidr_block ="${local.my_ip}/32"
    from_port=22
    to_port=22
  }

  egress {
   protocol="tcp"
   rule_no = 100
   action = "allow"
   cidr_block = "${data.external.my_ip}"
   from_port = 22
   to_port = 22
  }
  tags = {
    Name = "publicNACL"
  }
}

resource "aws_network_acl" "private2a" {
  vpc_id = data.aws_vpc.tf-vpc-project.id
  subnet_ids = [ data.aws_subnet.private2a.id ]

  ingress {
    protocol = "tcp"
    rule_no = 100
    action = "allow"
    cidr_block = data.aws_subnet.public1a.cidr_block
    from_port = 22
    to_port = 22
  }
  
  ingress {
    protocol = "tcp"
    rule_no = 110
    action = "allow"
    cidr_block = data.aws_subnet.private3a.cidr_block
    from_port = 22
    to_port = 22
  }
  egress {
    protocol = "tcp"
    rule_no = 100
    action = "allow"
    cidr_block = data.aws_subnet.public1a.cidr_block
    from_port = 22
    to_port = 22
  }
  egress {
    protocol = "tcp"
    rule_no = 110
    action = "allow"
    cidr_block = data.aws_subnet.private3a.cidr_block
    from_port = 22
    to_port = 22
  }

  tags = {
    Name = "private2aNACL"
  }
}

resource "aws_network_acl" "private3a" {
  vpc_id = data.aws_vpc.tf-vpc-project.id
  subnet_ids = [ data.aws_subnet.private3a.id]

  ingress {
    protocol = "tcp"
    rule_no = 100
    action = "allow"
    cidr_block = data.aws_subnet.private2a.cidr_block
    from_port = 22
    to_port = 22
  }

  egress {
    protocol = "tcp"
    rule_no = 100
    action = "allow"
    cidr_block = data.aws_subnet.private2a.cidr_block
    from_port = 22
    to_port = 22
  }
  tags = {
    Name = "private3aNACL"
  }
}