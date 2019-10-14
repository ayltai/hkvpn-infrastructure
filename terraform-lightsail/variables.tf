variable "region" {
  description = "AWS region"
  default     = "us-west-2"
}

variable "zone" {
  description = "Availability zone"
  default     = "us-west-2a"
}

variable "bundle_id" {
  description = "The size of the Lightsail instance to deploy"
  default     = "micro_2_0"
}

variable "blueprint_id" {
  description = "The OS image to deploy to Lightsail"
  default     = "ubuntu_18_04"
}

variable "public_key" {
  description = "Lightsail instance public key"
  default     = "~/.ssh/hkvpn.pub"
}

variable "private_key" {
  description = "Lightsail instance private key"
  default     = "~/.ssh/hkvpn.key"
}

variable "vault_password_file" {
  description = "Ansible Vault password file"
  default     = "~/vault.pass"
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
