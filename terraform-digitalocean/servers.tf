resource "digitalocean_droplet" "hkvpn" {
  name       = var.tag
  region     = var.region
  image      = var.image
  size       = var.size
  monitoring = var.monitoring

  ssh_keys = [
    digitalocean_ssh_key.hkvpn.fingerprint
  ]

  tags = [
    var.tag
  ]
}
