terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_iam_openid_connect_provider" "tfc" {
  url             = "https://app.terraform.io"
  client_id_list  = ["aws.workspaces.tfopenid"]
  thumbprint_list = [
    "693839077e2373e162bd4172d3665628556b82ce",
    "1c58a3a8518e8759bf075b76b750d4f2df264fcd",
    "9e99a48a9960b14926bb7f3b02e22da2b0ab7280"
  ]
}

data "aws_iam_policy_document" "tfc_assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.tfc.arn]
    }

    condition {
      test     = "StringEquals"
      variable = "app.terraform.io:aud"
      values   = ["aws.workspaces.tfopenid"]
    }

    condition {
      test     = "StringLike"
      variable = "app.terraform.io:sub"
      values   = [
        "organization:dodon-org:project:*:workspace:*:run_phase:*",
        "organization:dodon-org:workspace:*:run_phase:*"
      ]
    }
  }
}

resource "aws_iam_role" "tfc_role" {
  name               = "tfc-shop-role"
  assume_role_policy = data.aws_iam_policy_document.tfc_assume_role.json
}

resource "aws_iam_role_policy_attachment" "tfc_admin" {
  role       = aws_iam_role.tfc_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

output "role_arn" {
  value       = aws_iam_role.tfc_role.arn
  description = "Copy this ARN in TFC_AWS_RUN_ROLE_ARN"
}
