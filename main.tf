terraform {
  required_version = ">= 1.9"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket = "tf-state-bucket-dodon-2026"
    key    = "tf-shop/terraform.tfstate"
    region = "eu-central-1"
  }
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_s3_bucket" "assets" {
  bucket = "tf-shop-assets-dodon-2026"

  tags = {
    Name      = "tf-shop assets"
    ManagedBy = "terraform"
    Owner     = "Dodon"
  }
}
