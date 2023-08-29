
#--------------------------------------
# Resource Group Creation  
#--------------------------------------

resource "azurerm_resource_group" "example" {
  for_each = { for key, resource_group_name in var.rg_dict : key => resource_group_name }
  name     = each.value.resource_group_name
  location = each.value.region
  tags     = merge(each.value.tags, { "modified-at" : timestamp() })
}
