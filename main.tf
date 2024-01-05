terraform {
  backend "s3" {
    bucket         = "folof-terraform-network-bucket"
    key            = "terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "tf-lock-table"
    profile        = "backend"
  }
}