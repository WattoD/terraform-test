moved {
  from = aws_vpc.main
  to   = module.network.aws_vpc.main
}

moved {
  from = aws_internet_gateway.igw
  to   = module.network.aws_internet_gateway.igw
}

moved {
  from = aws_subnet.net["public-a"]
  to   = module.network.aws_subnet.net["public-a"]
}

moved {
  from = aws_subnet.net["private-b"]
  to   = module.network.aws_subnet.net["private-b"]
}

moved {
  from = aws_subnet.net["private-c"]
  to   = module.network.aws_subnet.net["private-c"]
}
