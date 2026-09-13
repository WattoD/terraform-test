terraform {
  required_version = ">= 1.9"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }

  cloud {
    organization = "dodon-org"

    workspaces {
      name = "tf-shop-dev"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_s3_bucket" "assets" {
  bucket = "tf-shop-assets-dodon-2026-${terraform.workspace}"

  tags = merge(
    local.common_tags,
    {
      Name = "tf-shop assets ${terraform.workspace}"
    }
  )
}

# Test OIDC PR check
