resource "digitalocean_floating_ip" "hkvpn" {
  droplet_id = digitalocean_droplet.hkvpn.id
  region     = var.region
}
