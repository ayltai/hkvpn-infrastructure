terraform {
  required_version = ">= 0.12"
}

provider "azurerm" {
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  version         = "~> 1.35"
}

provider "null" {
  version = "~> 2.1"
}

resource "azurerm_resource_group" "hkvpn" {
  name     = var.tag
  location = var.location

  tags = {
    Name = var.tag
  }
}
