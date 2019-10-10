variable "tenancy_ocid" {
  description = "OCID of your tenancy"
  type        = "string"
}

variable "user_ocid" {
  description = "OCID of the user calling the API"
  type        = "string"
}

variable "compartment_ocid" {
  description = "OCID of your compartment"
  type        = "string"
}

variable "fingerprint" {
  description = "Fingerprint for the key pair being used"
  type        = "string"
}

variable "public_key" {
  description = "The SSH public key used to authenticate the VM instance deployed"
  type        = "string"
}
