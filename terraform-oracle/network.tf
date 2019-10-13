resource "oci_core_vcn" "hkvpn" {
  display_name   = var.tag
  cidr_block     = var.vcn_cidr_block
  compartment_id = var.compartment_ocid

  freeform_tags = {
    Name = var.tag
  }
}

resource "oci_core_public_ip" "hkvpn" {
  display_name   = var.tag
  compartment_id = var.compartment_ocid
  lifetime       = "RESERVED"
  private_ip_id  = data.oci_core_private_ips.hkvpn.private_ips[0]["id"]

  freeform_tags = {
    Name = var.tag
  }
}
