#-------------------------------------------------
# Virtual Network Creation
#-------------------------------------------------

resource "azurerm_virtual_network" "vnet" {
  for_each            = { for ids, vnet_name in var.vnet_dict : ids => vnet_name }
  name                = each.value.vnet_name
  address_space       = each.value.cidr_block
  location            = var.region
  resource_group_name = each.value.resource_group_name
  tags                = var.tags
}

