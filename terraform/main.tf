provider "aws" {
  region = "eu-central-1"
}

//Point 2 'VPC Configuration'---
module "vpc" {
  source = "./modules/vpc"
}
//--------



