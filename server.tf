data "aws_ami" "al2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

resource "aws_security_group" "web" {
  name   = "${var.project}-sg"
  vpc_id = module.network.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "${var.project}-sg" }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.al2023.id
  instance_type = local.instance_type
  subnet_id     = module.network.subnet_ids["public-a"]

  tags = merge(
    local.common_tags,
    {
      Name = "tf-shop-web-${terraform.workspace}"
    }
  )
}
