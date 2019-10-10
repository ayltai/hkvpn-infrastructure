resource "oci_core_subnet" "hkvpn" {
  display_name        = var.tag
  vcn_id              = oci_core_vcn.hkvpn.id
  cidr_block          = var.subnet_cidr_block
  availability_domain = data.oci_identity_availability_domain.ad.name
  compartment_id      = var.compartment_ocid

  freeform_tags = {
    Name = var.tag
  }
}
