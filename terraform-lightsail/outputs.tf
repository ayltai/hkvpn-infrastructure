output "public_ip" {
  value = aws_lightsail_static_ip.hkvpn.ip_address
}
