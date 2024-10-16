terraform {
  backend "s3" {
    bucket         = "terraform-state-myvpc-project-12332345"
    key            = "global/s3/tf.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "tf-lock-table-1212234"
  }
}