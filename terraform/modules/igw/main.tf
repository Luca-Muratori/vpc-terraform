data "aws_vpc" "tf-vpc-project" {
  filter {
    name   = "tag:Name"
    values = ["tf-vpc-project"]
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = data.aws_vpc.tf-vpc-project.id
  tags = {
    Name = "main-igw"
  }
}