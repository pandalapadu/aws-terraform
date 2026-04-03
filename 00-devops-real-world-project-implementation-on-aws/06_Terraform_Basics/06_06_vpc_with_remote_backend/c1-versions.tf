terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.0"
    }
  }
  # Remote Backend
  backend "s3" {
    bucket = "tfstate-dev-ap-south-1-opq2r7" ##We have to change this name when commited
    key = "vpc/dev/terraform.tfstate" ##folder are created like we defined if not
    region = "ap-south-1"
    encrypt = true
    use_lockfile = true
  }
}

provider "aws" {
  region = var.aws_region
}