resource "azurerm_subnet" "hkvpn" {
  name                 = var.tag
  resource_group_name  = azurerm_resource_group.hkvpn.name
  virtual_network_name = azurerm_virtual_network.hkvpn.name
  address_prefix       = var.subnet_cidr_block
}
