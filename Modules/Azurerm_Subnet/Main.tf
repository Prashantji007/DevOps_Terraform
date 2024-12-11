resource "azurerm_subnet" "sn" {
  for_each = var.sn
  name = each.value.name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes = each.value.address_prefixes
  resource_group_name = each.value.resource_group_name
}