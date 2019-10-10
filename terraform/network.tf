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
  private_ip_id  = oci_core_private_ip.hkvpn.id

  freeform_tags = {
    Name = var.tag
  }
}

resource "oci_core_private_ip" "hkvpn" {
  display_name   = var.tag
  vnic_id        = oci_core_vcn.hkvpn.id
  hostname_label = var.hostname

  freeform_tags = {
    Name = var.tag
  }
}
