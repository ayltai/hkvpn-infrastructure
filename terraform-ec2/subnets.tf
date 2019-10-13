resource "aws_subnet" "hkvpn" {
  vpc_id            = aws_vpc.hkvpn.id
  availability_zone = var.zone
  cidr_block        = var.subnet_cidr_block

  tags = {
    Name = var.tag
  }
}

resource "aws_route_table" "hkvpn" {
  vpc_id = aws_vpc.hkvpn.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.hkvpn.id
  }

  tags = {
    Name = var.tag
  }
}

resource "aws_route_table_association" "hkvpn" {
  subnet_id      = aws_subnet.hkvpn.id
  route_table_id = aws_route_table.hkvpn.id
}
