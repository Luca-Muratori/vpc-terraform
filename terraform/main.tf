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



