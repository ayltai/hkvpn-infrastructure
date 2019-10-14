variable "region" {
  description = "AWS region"
  default     = "us-west-2"
}

variable "zone" {
  description = "Availability zone"
  default     = "us-west-2a"
}

variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  default     = "10.0.0.0/24"
}

variable "subnet_cidr_block" {
  description = "CIDR block for subnet"
  default     = "10.0.0.0/28"
}

variable "ami_filter" {
  description = "AMI filter"
  default     = "ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"
}

variable "ami_owner" {
  description = "AMI owner is Canonical"
  default     = "099720109477"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t3a.micro"
}

variable "storage_size" {
  description = "The size of the storage attached to EC2 instances"
  default     = 10
}

variable "ami_key_name" {
  description = "AMI key pair name"
  default     = "hkvpn"
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
  description = "AMI user"
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
