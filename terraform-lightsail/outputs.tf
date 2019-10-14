output "public_ip" {
  value = aws_lightsail_static_ip.public.ip_address
}
