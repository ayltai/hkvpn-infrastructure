resource "aws_instance" "hkvpn" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.hkvpn.id
  key_name      = aws_key_pair.hkvpn.key_name

  vpc_security_group_ids = [
    aws_security_group.hkvpn.id,
  ]

  root_block_device {
    volume_size = var.storage_size
  }

  tags = {
    Name = var.tag
  }
}

resource "null_resource" "exec" {
  triggers = {
    aws_eip_id = aws_eip.hkvpn.id,
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt -qq install python3 -y",
    ]

    connection {
      agent       = false
      timeout     = var.timeout
      host        = aws_eip.hkvpn.public_ip
      private_key = file(var.private_key)
      user        = var.username
    }
  }

  provisioner "local-exec" {
    command = <<EOT
      sleep 50;
      >inventory.ini;
      echo "[hkvpn]" | tee -a inventory.ini;
      echo "${aws_eip.hkvpn.public_ip} ansible_user=${var.username} ansible_ssh_private_key_file=${var.private_key}" | tee -a inventory.ini;
      export ANSIBLE_HOST_KEY_CHECKING=False;
      ansible-playbook -u ${var.username} --private-key ${var.private_key} --vault-password-file ${var.vault_password_file} --extra-vars "ip_address=${aws_eip.hkvpn.public_ip} network_interface=ens5" -i inventory.ini ../ansible/playbook.yml
    EOT
  }
}
