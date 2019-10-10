terraform {
  required_version = ">= 0.12"
}

provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key
  region           = var.region
}

output "instance_private_ip" {
  value = oci_core_instance.hkvpn.private_ip
}

output "instance_public_id" {
  value = oci_core_instance.hkvpn.public_ip
}
