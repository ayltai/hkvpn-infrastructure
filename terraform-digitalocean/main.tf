terraform {
  required_version = ">= 0.12"
}

provider "digitalocean" {
  version = "~> 1.9"
}

provider "null" {
  version = "~> 2.1"
}

output "public_id" {
  value = digitalocean_floating_ip.hkvpn.ip_address
}
