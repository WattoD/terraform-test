locals {
  name_prefix = var.project
  common_tags = {
    Project   = var.project
    ManagedBy = "terraform"
    Owner     = "Dodon"
  }
}
