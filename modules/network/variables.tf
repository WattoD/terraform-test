variable "project" {
  type        = string
  description = "Project name"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR block"
}

variable "subnets" {
  type = map(object({
    netnum        = number
    az            = string
    map_public_ip = bool
  }))
  description = "Map of subnets configuration"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Common tags"
}
