

#-------------------------------------------------
# Virtual Network's Subnets Creation
#-------------------------------------------------

resource "azurerm_subnet" "subnet" {
  for_each                                       = { for ids, snet_name in var.snet_dict : ids => snet_name }
  name                                           = each.value.snet_name
  resource_group_name                            = each.value.resource_group_name
  address_prefixes                               = each.value.address_prefixes
  virtual_network_name                           = each.value.vnet_name
  service_endpoints                              = each.value.service_endpoints
  enforce_private_link_endpoint_network_policies = each.value.enforce_private_link_endpoint_network_policies

  dynamic "delegation" {
    for_each = var.delegation != null ? [true] : []

    content {
      name = var.delegation.name

      service_delegation {
        name    = var.delegation.service_delegation_name
        actions = var.delegation.service_delegation_actions
      }
    }
  }
}
