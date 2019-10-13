resource "aws_vpc" "hkvpn" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = var.tag
  }
}

resource "aws_eip" "hkvpn" {
  instance = aws_instance.hkvpn.id
  vpc      = true

  depends_on = [
    aws_internet_gateway.hkvpn
  ]

  tags = {
    Name = var.tag
  }
}
