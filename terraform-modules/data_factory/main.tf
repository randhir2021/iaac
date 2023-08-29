
#--------------------------------------
# Azure Data Factory
#--------------------------------------

resource "azurerm_data_factory" "adf" {
  # checkov:skip=CKV2_AZURE_15: ADD REASON
  # checkov:skip=CKV_AZURE_104: ADD REASON
  for_each                        = { for key, adf_name in var.adf_dict : key => adf_name }
  name                            = each.value.adf_name
  location                        = each.value.region
  resource_group_name             = each.value.resource_group_name
  managed_virtual_network_enabled = each.value.managed_virtual_network_enabled
  public_network_enabled          = each.value.public_network_enabled
  tags                            = each.value.tags

  dynamic "identity" {
    for_each = length(each.value.identity_ids) == 0 && each.value.identity_type == "SystemAssigned" ? [each.value.identity_type] : []

    content {
      type = each.value.identity_type
    }
  }
  dynamic "identity" {
    for_each = length(each.value.identity_ids) > 0 || each.value.identity_type == "UserAssigned" ? [each.value.identity_type] : []

    content {
      type         = each.value.identity_type
      identity_ids = length(each.value.identity_ids) > 0 ? each.value.identity_ids : []
    }
  }

  dynamic "global_parameter" {
    for_each = each.value.global_parameters_required == false ? toset([]) : toset([1])
    content {
      name  = each.value.global_parameter_key
      type  = each.value.global_parameter_type
      value = each.value.global_parameter_value
    }
  }

  dynamic "github_configuration" {
    for_each = each.value.github_configuration_required == false ? toset([]) : toset([1])
    content {
      git_url         = each.value.git_url
      account_name    = each.value.git_account_name
      branch_name     = each.value.branch_name
      repository_name = each.value.repository_name
      root_folder     = each.value.root_folder
    }
  }
}