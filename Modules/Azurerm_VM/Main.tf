data "azurerm_subnet" "subdata" {
  for_each             = var.ni
  name                 = "promosn1"
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name

}

resource "azurerm_public_ip" "pip" {
  for_each            = var.ni
  name                = each.value.publicipname
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = "Static"
}


resource "azurerm_network_interface" "ni" {
  for_each            = var.ni
  name                = each.value.nicname
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = each.value.publicipname
    subnet_id                     = data.azurerm_subnet.subdata[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip[each.key].id
  }
}


resource "azurerm_linux_virtual_machine" "name" {
  for_each              = var.ni
  name                  = each.value.VMname
  location              = each.value.location
  resource_group_name   = each.value.resource_group_name
  network_interface_ids = [azurerm_network_interface.ni[each.key].id]
  size                  = "Standard_B1s"
  admin_username        = "testadmin"
  admin_password        = "Prashant@123"
disable_password_authentication = false

   os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
