variable "subscription_id" {
  description = "The ID of your Azure account subscription"
  type        = "string"
}

variable "client_id" {
  description = "The Client ID required for managing Auzre resources"
  type        = "string"
}

variable "client_secret" {
  description = "The Client Secret required for managing Azure resources"
  type        = "string"
}

variable "tenant_id" {
  description = "The Tenant ID required for managing Azure resources"
  type        = "string"
}

variable "ssh_public_key" {
  description = "The SSH public key used to authenticate with the deployed Azure VM"
  type        = "string"
}
