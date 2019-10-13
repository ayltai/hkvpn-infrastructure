resource "aws_lightsail_key_pair" "hkvpn" {
  name       = var.tag
  public_key = file(var.public_key)
}
