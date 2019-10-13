resource "aws_lightsail_static_ip" "hkvpn" {
  name = var.tag
}

resource "aws_lightsail_static_ip_attachment" "hkvpn" {
  instance_name  = aws_lightsail_instance.hkvpn.name
  static_ip_name = aws_lightsail_static_ip.hkvpn.name
}
