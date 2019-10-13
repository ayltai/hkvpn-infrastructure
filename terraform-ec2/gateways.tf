resource "aws_internet_gateway" "hkvpn" {
  vpc_id = aws_vpc.hkvpn.id

  tags = {
    Name = var.tag
  }
}
