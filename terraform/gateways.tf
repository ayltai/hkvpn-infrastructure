resource "oci_core_internet_gateway" "hkvpn" {
  vcn_id         = oci_core_vcn.hkvpn.id
  compartment_id = var.compartment_ocid
  display_name   = var.tag

  freeform_tags = {
    Name = var.tag
  }
}
