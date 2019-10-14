resource "azurerm_virtual_machine" "hkvpn" {
  name                             = var.tag
  location                         = var.location
  resource_group_name              = azurerm_resource_group.hkvpn.name
  vm_size                          = var.vm_size
  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  network_interface_ids = [
    azurerm_network_interface.hkvpn.id
  ]

  os_profile {
    computer_name  = var.tag
    admin_username = var.username
  }

  os_profile_linux_config {
    disable_password_authentication = true

    ssh_keys {
      path     = "/home/${var.username}/.ssh/authorized_keys"
      key_data = var.ssh_public_key
    }
  }

  storage_os_disk {
    name              = var.tag
    create_option     = "FromImage"
    caching           = "ReadWrite"
    managed_disk_type = var.disk_type
    disk_size_gb      = var.disk_size
  }

  storage_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = "latest"
  }

  tags = {
    Name = var.tag
  }
}

resource "null_resource" "exec" {
  depends_on = [
    azurerm_virtual_machine.hkvpn,
  ]

  provisioner "remote-exec" {
    inline = [
      "sudo apt update; sudo apt -qq install python -y",
    ]

    connection {
      agent       = false
      timeout     = var.timeout
      host        = azurerm_public_ip.hkvpn.ip_address
      private_key = file(var.private_key)
      user        = var.username
    }
  }

  provisioner "local-exec" {
    command = <<EOT
      sleep 50;
      >inventory.ini;
      echo "[hkvpn]" | tee -a inventory.ini;
      echo "${azurerm_public_ip.hkvpn.ip_address} ansible_user=${var.username} ansible_ssh_private_key_file=${var.private_key}" | tee -a inventory.ini;
      export ANSIBLE_HOST_KEY_CHECKING=False;
      ansible-playbook -u ${var.username} --private-key ${var.private_key} --vault-password-file ${var.vault_password_file} --extra-vars "ip_address=${azurerm_public_ip.hkvpn.ip_address}" -i inventory.ini ../ansible/playbook.yml
    EOT
  }
}
