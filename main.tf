provider "azurerm" {
  version = "3.27.0"
  features {}
}
terraform {
  ##Backend variables are initialized by Azure DevOps
  backend "azurerm" {}
}

locals {
  tags                        = merge(var.extra_tags, { "Environment" : var.environment })
}
module "resource_group" {

  count  = var.DeployAzResourceGroup == "Yes" ? 1 : 0
  source = "./terraform-modules/resource_group/"
  #
  #
  #
  rg_dict = var.rg_dict

}
module "vnet" {

  count  = var.DeployAzVirtualNetwork == "Yes" ? 1 : 0
  source = "./terraform-modules/virtual_network/"
  #
  #
  #
  depends_on = [
    module.resource_group,
  ]
  region       = var.region
  tags         = local.tags
  vnet_dict    = var.vnet_dict
}
module "snet" {

  count  = var.DeployAzSubnet == "Yes" ? 1 : 0
  source = "./terraform-modules/subnet/"
  #
  depends_on = [
    module.vnet,
  ]
  snet_dict = var.snet_dict
}

module "adf" {

  count = var.DeployAzDataFactory == "Yes" ? 1 : 0
  source = "./terraform-modules/data_factory/"
  #
  #
  #
  depends_on = [
    module.resource_group,
  ]
  adf_dict = var.adf_dict
 
}

