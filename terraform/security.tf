resource "oci_core_network_security_group" "hkvpn" {
  vcn_id         = oci_core_vcn.hkvpn.id
  compartment_id = var.compartment_ocid
  display_name   = var.tag

  freeform_tags = {
    Name = var.tag
  }
}

resource "oci_core_network_security_group_security_rule" "ssh" {
  network_security_group_id = oci_core_network_security_group.hkvpn.id
  direction                 = "INGRESS"
  source                    = "0.0.0.0/0"
  source_type               = "CIDR_BLOCK"
  protocol                  = "6"

  tcp_options {
    destination_port_range {
      max = var.ssh_port
      min = var.ssh_port
    }
  }
}

resource "oci_core_network_security_group_security_rule" "http" {
  network_security_group_id = oci_core_network_security_group.hkvpn.id
  direction                 = "INGRESS"
  source                    = "0.0.0.0/0"
  source_type               = "CIDR_BLOCK"
  protocol                  = "6"

  tcp_options {
    destination_port_range {
      max = var.http_port
      min = var.http_port
    }
  }
}

resource "oci_core_network_security_group_security_rule" "https" {
  network_security_group_id = oci_core_network_security_group.hkvpn.id
  direction                 = "INGRESS"
  source                    = "0.0.0.0/0"
  source_type               = "CIDR_BLOCK"
  protocol                  = "6"

  tcp_options {
    destination_port_range {
      max = var.https_port
      min = var.https_port
    }
  }
}
