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

resource "null_resource" "exec" {
  depends_on = [
    digitalocean_droplet.hkvpn,
  ]

  provisioner "remote-exec" {
    inline = [
      "sudo apt update && sudo apt -qq install python -y",
    ]

    connection {
      agent       = false
      timeout     = var.timeout
      host        = digitalocean_droplet.hkvpn.ipv4_address
      private_key = file(var.private_key)
      user        = var.username
    }
  }

  provisioner "local-exec" {
    command = <<EOT
      sleep 50;
      >inventory.ini;
      echo "[hkvpn]" | tee -a inventory.ini;
      echo "${digitalocean_droplet.hkvpn.ipv4_address} ansible_user=${var.username} ansible_ssh_private_key_file=${var.private_key}" | tee -a inventory.ini;
      export ANSIBLE_HOST_KEY_CHECKING=False;
      ansible-playbook -u ${var.username} --private-key ${var.private_key} --vault-password-file ${var.vault_password_file} --extra-vars "ip_address=${digitalocean_droplet.hkvpn.ipv4_address}" -i inventory.ini ../ansible/playbook.yml
    EOT
  }
}
