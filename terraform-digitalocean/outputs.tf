output "static_public_id" {
  value = digitalocean_floating_ip.hkvpn.ip_address
}

output "dynamic_public_ip" {
  value = digitalocean_droplet.hkvpn.ipv4_address
}
