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

variable "api_private_key" {
  description = "The path (including filename) of the API private key stored on your computer"
  type        = "string"
}

variable "ssh_public_key" {
  description = "The SSH public key used to authenticate the VM instance deployed"
  type        = "string"
}

variable "private_key_password" {
  description = "Passphrase used for the API private key"
  type        = "string"
}
