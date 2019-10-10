data "oci_identity_availability_domain" "ad" {
  compartment_id = var.tenancy_ocid
  ad_number      = 1
}

data "oci_core_private_ips" "hkvpn" {
  ip_address = oci_core_instance.hkvpn.private_ip
  subnet_id  = oci_core_subnet.hkvpn.id
}
