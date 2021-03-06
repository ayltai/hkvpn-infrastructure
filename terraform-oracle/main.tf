terraform {
  required_version = ">= 0.12"
}

provider "oci" {
  tenancy_ocid         = var.tenancy_ocid
  user_ocid            = var.user_ocid
  fingerprint          = var.fingerprint
  private_key_path     = var.api_private_key
  private_key_password = var.private_key_password
  region               = var.region
  version              = "~> 3.47"
}

provider "null" {
  version = "~> 2.1"
}
