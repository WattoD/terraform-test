module "network" {
  source   = "./modules/network"
  project  = var.project
  vpc_cidr = var.vpc_cidr
  subnets  = var.subnets
  tags     = local.common_tags
}

resource "aws_route_table" "public" {
  vpc_id = module.network.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = module.network.igw_id
  }

  tags = merge(local.common_tags, { Name = "${var.project}-rt" })
}

resource "aws_route_table_association" "public" {
  subnet_id      = module.network.subnet_ids["public-a"]
  route_table_id = aws_route_table.public.id
}
