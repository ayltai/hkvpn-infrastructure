resource "digitalocean_ssh_key" "hkvpn" {
  name       = var.tag
  public_key = file(var.public_key)
}

resource "digitalocean_firewall" "hkvpn" {
  name = var.tag

  droplet_ids = [
    digitalocean_droplet.hkvpn.id
  ]

  inbound_rule {
    protocol = "icmp"

    source_addresses = [
      "0.0.0.0/0",
      "::/0",
    ]
  }

  inbound_rule {
    protocol   = "tcp"
    port_range = var.ssh_port

    source_addresses = [
      "0.0.0.0/0",
      "::/0",
    ]
  }

  inbound_rule {
    protocol   = "tcp"
    port_range = var.http_port

    source_addresses = [
      "0.0.0.0/0",
      "::/0",
    ]
  }

  inbound_rule {
    protocol   = "tcp"
    port_range = var.https_port

    source_addresses = [
      "0.0.0.0/0",
      "::/0",
    ]
  }

  inbound_rule {
    protocol   = "udp"
    port_range = var.openvpn_port

    source_addresses = [
      "0.0.0.0/0",
      "::/0",
    ]
  }

  outbound_rule {
    protocol = "icmp"

    destination_addresses = [
      "0.0.0.0/0",
      "::/0",
    ]
  }

  outbound_rule {
    protocol   = "udp"
    port_range = "1-65535"

    destination_addresses = [
      "0.0.0.0/0",
      "::/0",
    ]
  }

  outbound_rule {
    protocol   = "tcp"
    port_range = "1-65535"

    destination_addresses = [
      "0.0.0.0/0",
      "::/0",
    ]
  }
}
