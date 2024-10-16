resource "aws_vpc" "main" {
  cidr_block = var.vpc_ip_cidr
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name="tf-vpc-project"
  }
}
