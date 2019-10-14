variable "location" {
  description = "The location where all the resources should be created"
  default     = "West US 2"
}

variable "image_publisher" {
  description = "The publisher of the OS image used to create Azure VM"
  default     = "Canonical"
}

variable "image_offer" {
  description = "The offer of the OS image used to create Azure VM"
  default     = "UbuntuServer"
}

variable "image_sku" {
  description = "The SKU of the OS image used to create Azure VM"
  default     = "18.04.0-LTS"
}

variable "vm_size" {
  description = "The size of the VM to be deployed"
  default     = "Standard_B1s"
}

variable "disk_type" {
  description = "The type of the disk of the Azure VM"
  default     = "StandardSSD_LRS"
}

variable "disk_size" {
  description = "The size of the data disk of the Azure VM in gigabytes"
  default     = 10
}

variable "vnet_cidr_block" {
  description = "CIDR block for Azure Virtual Network"
  default     = "10.0.0.0/24"
}

variable "subnet_cidr_block" {
  description = "CIDR block for subnet"
  default     = "10.0.0.0/28"
}

variable "public_key" {
  description = "EC2 instance public key"
  default     = "~/.ssh/hkvpn.pub"
}

variable "private_key" {
  description = "EC2 instance private key"
  default     = "~/.ssh/hkvpn.key"
}

variable "vault_password_file" {
  description = "Ansible Vault password file"
  default     = "~/vault.pass"
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

variable "openvpn_port" {
  description = "The port for handling OpenVPN traffic"
  default     = 1194
}

variable "username" {
  description = "OS user"
  default     = "ubuntu"
}

variable "timeout" {
  description = "The maximum amount of time allowed to deploy EC2 instance"
  default     = "60m"
}

variable "tag" {
  description = "The tag for all resources used in this application"
  default     = "hkvpn"
}
