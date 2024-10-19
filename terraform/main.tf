provider "aws" {
  region = "eu-central-1"
}

//Point 2 'VPC Configuration'
module "vpc" {
  source = "./modules/vpc"
}

//Point 4 - subnet creation
module "subnets" {
  source = "./modules/subnet"
}

//Point 5 - internet gateway
module "igw" {
  source = "./modules/igw"
}

//Point 7 - route tables
module "route-tables" {
  source = "./modules/route-tables"
}

//Point 8 - nacls
module "nacls" {
  source = "./modules/nacl"
}

//Point 9 - security groups
module "security-groups" {
  source = "./modules/security-groups"
}

//Point 10 - ec2 instances
module "ec2" {
  source = "./modules/ec2"
}



