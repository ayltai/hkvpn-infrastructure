resource "azurerm_network_security_group" "hkvpn" {
  name                = var.tag
  location            = var.location
  resource_group_name = azurerm_resource_group.hkvpn.name

  tags = {
    Name = var.tag
  }
}

resource "azurerm_network_security_rule" "ssh" {
  name                        = "SSH"
  resource_group_name         = azurerm_resource_group.hkvpn.name
  network_security_group_name = azurerm_network_security_group.hkvpn.name
  priority                    = 100
  protocol                    = "Tcp"
  direction                   = "Inbound"
  access                      = "Allow"
  source_port_range           = "*"
  destination_port_range      = var.ssh_port
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
}

resource "azurerm_network_security_rule" "http" {
  name                        = "HTTP"
  resource_group_name         = azurerm_resource_group.hkvpn.name
  network_security_group_name = azurerm_network_security_group.hkvpn.name
  priority                    = 100
  protocol                    = "Tcp"
  direction                   = "Inbound"
  access                      = "Allow"
  source_port_range           = "*"
  destination_port_range      = var.http_port
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
}

resource "azurerm_network_security_rule" "HTTPS" {
  name                        = "HTTPS"
  resource_group_name         = azurerm_resource_group.hkvpn.name
  network_security_group_name = azurerm_network_security_group.hkvpn.name
  priority                    = 100
  protocol                    = "Tcp"
  direction                   = "Inbound"
  access                      = "Allow"
  source_port_range           = "*"
  destination_port_range      = var.https_port
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
}

resource "azurerm_network_security_rule" "openvpn" {
  name                        = "OpenVPN"
  resource_group_name         = azurerm_resource_group.hkvpn.name
  network_security_group_name = azurerm_network_security_group.hkvpn.name
  priority                    = 100
  protocol                    = "Udp"
  direction                   = "Inbound"
  access                      = "Allow"
  source_port_range           = "*"
  destination_port_range      = var.openvpn_port
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
}
