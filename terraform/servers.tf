resource "oci_core_instance" "hkvpn" {
  display_name        = var.tag
  shape               = var.instance_shape
  compartment_id      = var.compartment_ocid
  availability_domain = var.instance_availability_domain

  create_vnic_details {
    display_name     = var.tag
    subnet_id        = oci_core_subnet.hkvpn.id
    assign_public_ip = "true"
    hostname_label   = var.hostname

    freeform_tags = {
      Name = var.tag
    }
  }

  source_details {
    source_type             = "image"
    source_id               = var.instance_image_ocid
    boot_volume_size_in_gbs = var.instance_volume_size
  }

  metadata = {
    ssh_authorized_keys = var.public_key
  }

  freeform_tags = {
    Name = var.tag
  }

  timeouts {
    create = var.timeout
  }
}

resource "null_resource" "exec" {
  depends_on = [
    oci_core_instance.hkvpn,
  ]

  provisioner "remote-exec" {
    inline = [
      "sudo apt -qq install python -y",
    ]

    connection {
      agent       = false
      timeout     = var.timeout
      host        = oci_core_instance.hkvpn.public_ip
      private_key = var.private_key
      user        = var.username
    }
  }

  provisioner "local-exec" {
    command = <<EOT
      sleep 50;
      >inventory.ini;
      echo "[hkvpn]" | tee -a inventory.ini;
      echo "${oci_core_instance.hkvpn.public_ip} ansible_user=${var.username} ansible_ssh_private_key_file=${var.private_key}" | tee -a inventory.ini;
      export ANSIBLE_HOST_KEY_CHECKING=False;
      ansible-playbook -u ${var.username} --private-key ${var.private_key} --vault-password-file ${var.vault_password_file} -i inventory.ini ../ansible/playbook.yml
    EOT
  }
}
