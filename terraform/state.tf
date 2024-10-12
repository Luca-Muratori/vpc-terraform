terraform {
  backend "s3" {
    bucket = "tf-state-myvpc-project-12332345"
    key = "global/s3/terraform.tfstate"
    region = "eu-central-1"
    dynamodb_table = "terraform-lock-table-1212234"
  }
}