variable "subnet_cidr" {
  type = list(object({
    name = string,
    cidr = string
  }))
  default = [
    {
      name = "Public1A",
      cidr = "10.0.0.1/24"
    },
    {
      name = "Private2A",
      cidr = "10.0.0.2/24"
    },
    {
      name = "Private3A",
      cidr = "10.0.0.3/24"
    },
  ]
}

data "aws_vpc" "tf-vpc-project" {
  filter {
    name   = "tag:Name"
    values = ["tf-vpc-project"]
  }
}

variable "vpc_id" {
  type    = string
  default = data.aws_vpc.tf-vpc-project.id
}
