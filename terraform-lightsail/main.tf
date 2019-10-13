terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  access_key = var.lightsail_access_key
  secret_key = var.lightsail_secret_key
  region     = var.region
  version    = "~> 2.32"
}

provider "null" {
  version = "~> 2.1"
}

output "public_ip" {
  value = aws_lightsail_static_ip.hkvpn.ip_address
}
