data "aws_vpc" "tf-vpc-project" {
  filter {
    name   = "tag:Name"
    values = ["tf-vpc-project"]
  }
}

data "aws_internet_gateway" "main-igw" {
  filter {
    name   = "tag:Name"
    values = ["main-igw"]
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
    values = ["Public2A"]
  }
}
data "aws_subnet" "private3a" {
  filter {
    name   = "tag:Name"
    values = ["Public3A"]
  }
}

resource "aws_route_table" "public1a" {
  vpc_id = data.aws_vpc.tf-vpc-project.id

  tags = {
    Name = "public-route-table-1"
  }
}

resource "aws_route" "public_internet_gateway" {
  route_table_id = aws_route_table.public1a.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = data.aws_internet_gateway.main-igw.id
}

resource "aws_route_table" "private2a" {
  vpc_id = data.aws_vpc.tf-vpc-project.id
  tags = {
    Name = "private-route-table-2"
  }
}

resource "aws_route_table" "private3a" {
  vpc_id = data.aws_vpc.tf-vpc-project.id
  tags = {
    Name = "private-route-table-3"
  }
}

resource "aws_route_table_association" "public1a" {
  subnet_id      = data.aws_subnet.public1a.id
  route_table_id = aws_route_table.public1a
}

resource "aws_route_table_association" "private2a" {
  subnet_id      = data.aws_subnet.private2a.id
  route_table_id = aws_route_table.private2a
}

resource "aws_route_table_association" "private3a" {
  subnet_id      = data.aws_subnet.private3a.id
  route_table_id = aws_route_table.private3a
}