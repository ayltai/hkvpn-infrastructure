resource "aws_lightsail_instance" "hkvpn" {
  name              = "${var.tag}-instance"
  bundle_id         = var.bundle_id
  blueprint_id      = var.blueprint_id
  availability_zone = var.zone
  key_pair_name     = aws_lightsail_key_pair.hkvpn.name
}

resource "null_resource" "exec" {
  triggers = {
    aws_lightsail_instance_id  = aws_lightsail_instance.hkvpn.id,
    aws_lightsail_static_ip_id = aws_lightsail_static_ip.hkvpn.id,
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt -qq install python3 -y",
    ]

    connection {
      agent       = false
      timeout     = var.timeout
      host        = aws_lightsail_static_ip.hkvpn.ip_address
      private_key = file(var.private_key)
      user        = var.username
    }
  }

  provisioner "local-exec" {
    command = <<EOT
      sleep 50;
      >inventory.ini;
      echo "[hkvpn]" | tee -a inventory.ini;
      echo "${aws_lightsail_static_ip.hkvpn.ip_address} ansible_user=${var.username} ansible_ssh_private_key_file=${var.private_key}" | tee -a inventory.ini;
      export ANSIBLE_HOST_KEY_CHECKING=False;
      ansible-playbook -u ${var.username} --private-key ${var.private_key} --vault-password-file ${var.vault_password_file} --extra-vars "ip_address=${aws_lightsail_static_ip.hkvpn.ip_address}" -i inventory.ini ../ansible/playbook.yml
    EOT
  }
}
