data "azurerm_subnet" "subdata" {
  for_each             = var.nsg
  name                 = "promosn1"
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

resource "azurerm_network_security_group" "nsg1" {
    for_each = var.nsg
  name                = each.value.nsgname
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  security_rule {
    name                       = each.value.security_rule_name
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Dev"
  }
}

# Associate NSG with Subnet
resource "azurerm_subnet_network_security_group_association" "nsg_association" {
    for_each = var.nsg
  subnet_id                 = data.azurerm_subnet.subdata[each.key].id
  network_security_group_id = azurerm_network_security_group.nsg1[each.key].id
}

