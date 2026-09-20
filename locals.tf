locals {
  name_prefix   = var.project
  instance_type = terraform.workspace == "prod" ? "t3.small" : "t3.micro"

  common_tags = {
    Project   = var.project
    ManagedBy = "terraform"
    Owner     = "Dodon"
    Env       = terraform.workspace
  }
}
