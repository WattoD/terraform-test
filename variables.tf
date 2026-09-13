variable "project" {
  type    = string
  default = "tf-shop"
}

variable "region" {
  type    = string
  default = "eu-central-1"
}

variable "vpc_cidr" {
  type    = string
  default = "10.10.0.0/16"
}

variable "subnet_cidr" {
  type    = string
  default = "10.10.1.0/24"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "subnets" {
  type = map(object({
    netnum        = number
    az            = string
    map_public_ip = bool
    associate_rt  = bool
  }))
  default = {
    "public-a" = {
      netnum        = 1
      az            = "eu-central-1a"
      map_public_ip = true
      associate_rt  = true
    }
    "public-b" = {
      netnum        = 2
      az            = "eu-central-1b"
      map_public_ip = true
      associate_rt  = false
    }
    "private-b" = {
      netnum        = 11
      az            = "eu-central-1b"
      map_public_ip = false
      associate_rt  = false
    }
    "private-c" = {
      netnum        = 12
      az            = "eu-central-1c"
      map_public_ip = false
      associate_rt  = false
    }
  }
}
