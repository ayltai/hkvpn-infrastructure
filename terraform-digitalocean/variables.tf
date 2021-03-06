variable "region" {
  description = "The region of the Droplet to deploy to"
  default     = "sfo2"
}

variable "image" {
  description = "The ID of the Droplet image to deploy"
  default     = "ubuntu-18-04-x64"
}

variable "size" {
  description = "The ID of the type of the Droplet to deploy"
  default     = "s-1vcpu-1gb"
}

variable "monitoring" {
  description = "Whether monitoring agent should be installed"
  default     = true
}

variable "public_key" {
  description = "The path of the SSH public key used to authenticate with the Droplet deployed"
  default     = "/root/.ssh/hkvpn.pub"
}

variable "private_key" {
  description = "Lightsail instance private key"
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
  default     = "root"
}

variable "timeout" {
  description = "The maximum amount of time allowed to deploy EC2 instance"
  default     = "60m"
}

variable "tag" {
  description = "The tag that applies to all resources used by HK VPN"
  default     = "hkvpn"
}
