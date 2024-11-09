terraform {
  backend "s3" {
    bucket = "terraform-state-file-dk"
    region = "us-east-1"
    key = "dk/terraform.tfstate"
  }
}