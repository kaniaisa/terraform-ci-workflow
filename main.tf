terraform {
  backend "s3" {
    bucket = "aisa-tfstate"
    key    = "terraform-ci/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "workshop" {
  bucket_prefix = "aisa-ci-bucket-"
}