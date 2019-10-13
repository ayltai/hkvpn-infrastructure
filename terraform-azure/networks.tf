resource "azurerm_virtual_network" "hkvpn" {
  name                = var.tag
  location            = var.location
  resource_group_name = azurerm_resource_group.hkvpn.name

  address_space = [
    var.vnet_cidr_block
  ]

  tags = {
    Name = var.tag
  }
}

resource "azurerm_public_ip" "hkvpn" {
  name                = var.tag
  location            = var.location
  resource_group_name = azurerm_resource_group.hkvpn.name
  allocation_method   = "Static"

  tags = {
    Name = var.tag
  }
}

resource "azurerm_network_interface" "hkvpn" {
  name                      = var.tag
  location                  = var.location
  resource_group_name       = azurerm_resource_group.hkvpn.name
  network_security_group_id = azurerm_network_security_group.hkvpn.id

  ip_configuration {
    name                          = var.tag
    subnet_id                     = azurerm_subnet.hkvpn.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.hkvpn.id
  }

  tags = {
    Name = var.tag
  }
}
