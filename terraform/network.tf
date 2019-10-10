resource "oci_core_vcn" "hkvpn" {
  display_name   = var.tag
  cidr_block     = var.vcn_cidr_block
  compartment_id = var.compartment_ocid

  freeform_tags = {
    Name = var.tag
  }
}
