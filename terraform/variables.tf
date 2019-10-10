variable "private_key" {
  description = "The path (including filename) of the private key stored on your computer"
  default     = "~/.ssh/hkvpn.pem"
}

variable "vault_password_file" {
  description = "Ansible Vault password file"
  default     = "~/vault.pass"
}

variable "region" {
  description = "An Oracle Cloud Infrastructure region"
  default     = "ap-tokyo-1"
}

variable "instance_shape" {
  description = "The shape of the VM instance to deploy"
  default     = "VM.Standard.E2.1.Micro"
}

variable "instance_image_ocid" {
  description = "The VM instance image OCID"
  default     = "ocid1.image.oc1.ap-tokyo-1.aaaaaaaajkwiyx23yb56vifu4att2bnvcwfolahcvuatcyeensbmsflaiabq" // Canonical-Ubuntu-18.04-Minimal-2019.09.21-0
}

variable "instance_availability_domain" {
  description = "The availability domain of the VM instance"
  default     = "OECG:AP-TOKYO-1-AD-1"
}

variable "instance_volume_size" {
  description = "The size of the boot volume in GBs"
  default     = 50
}

variable "vcn_cidr_block" {
  description = "CIDR block for VCN"
  default     = "10.0.0.0/24"
}

variable "subnet_cidr_block" {
  description = "CIDR block for subnet"
  default     = "10.0.0.0/28"
}

variable "ssh_port" {
  description = "The port for handling SSH requests"
  default     = 22
}

variable "http_port" {
  description = "The port used for creating ACME certificate using http-01 challenge"
  default     = 80
}

variable "https_port" {
  description = "The port for handling HTTPS web requests"
  default     = 443
}

variable "hostname" {
  description = "The hostname of the VM instance to deploy"
  default     = "hkvpn.dev"
}

variable "username" {
  description = "The username to log into the VM instance"
  default     = "ubuntu"
}

variable "timeout" {
  description = "The maximum amount of time allowed to deploy the VM instance"
  default     = "60m"
}

variable "tag" {
  description = "The default tag for all resources used"
  default     = "hkvpn"
}
