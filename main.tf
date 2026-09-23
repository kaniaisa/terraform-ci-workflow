terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0"
    }
  }

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
  #checkov:skip=CKV2_AWS_61:Workshop bucket does not require lifecycle configuration
  #checkov:skip=CKV2_AWS_62:Workshop bucket does not require event notifications
  #checkov:skip=CKV2_AWS_6:Workshop exercise does not require public access block
  #checkov:skip=CKV_AWS_21:Workshop exercise does not require versioning
  #checkov:skip=CKV_AWS_18:Workshop exercise does not require access logging
  #checkov:skip=CKV_AWS_145:Workshop exercise does not require KMS encryption
  #checkov:skip=CKV_AWS_144:Workshop exercise does not require cross-region replication

  bucket_prefix = "aisa-ci-bucket-"
}