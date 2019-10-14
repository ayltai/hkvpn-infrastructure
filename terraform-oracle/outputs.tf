output "private_ip" {
  value = oci_core_instance.hkvpn.private_ip
}

output "public_id" {
  value = oci_core_public_ip.hkvpn.ip_address
}
