#-------------------------------------------------
# Confirmation on resource deployment 
#-------------------------------------------------
DeployAzResourceGroup      = "Yes"
DeployAzVirtualNetwork     = "No"
DeployAzSubnet             = "No"
DeployAzDataFactory        = "No"

#-------------------------------------------------
# Values for generic variables 
#-------------------------------------------------
environment = "test"
region      = "West Europe"
extra_tags = {
  "ProjectOwner" : "ThinkCloudly",
  "Created-at" : "2023-07-22T00:00:00Z",
  "Created-by" : "ThinkCloudly"
  
}

#-------------------------------------------------
# Values for resource group variables 
#-------------------------------------------------
rg_dict = [

  {
    resource_group_name = "rg-azurepoc-004"
    region              = "West Europe"
    tags = {
            "ProjectOwner" : "ThinkCloudly",
            "Created-at" : "2023-07-22T00:00:00Z",
            "Created-by" : "ThinkCloudly"
            
}
  }        
]
#--------------------------------------
# Values for Virtual Network variables 
#--------------------------------------
vnet_dict = [
  {
    vnet_name           = "vnet-azurepoc-test"
    resource_group_name = "rg-azurepoc-test"
    cidr_block          = ["10.0.0.0/16"]

  }
]
#--------------------------------------
# Values for Subnet variables 
#--------------------------------------

snet_dict = [
  {
    snet_name                                      = "snet-azurepoc-test"
    resource_group_name                            = "rg-azurepoc-test"
    address_prefixes                               = ["10.0.0.0/24"]
    vnet_name                                      = "vnet-azurepoc-test"
    service_endpoints                              = ["Microsoft.Storage", "Microsoft.KeyVault"]
    enforce_private_link_endpoint_network_policies = false

  }
]

#--------------------------------------
# Values for Data Factory variables 
#--------------------------------------

adf_dict = [
  {
    managed_virtual_network_enabled = true
    public_network_enabled          = false
    identity_type                   = "SystemAssigned"
    resource_group_name             = "rg-azurepoc-test"
    adf_name                        = "adf-azurepoc-test"
    identity_ids                    = ""
    region      = "West Europe"
    tags = {
            "ProjectOwner" : "ThinkCloudly",
            "Created-at"   : "2023-07-22T00:00:00Z",
            "Created-by"   : "ThinkCloudly"
            
}
    global_parameters_required    = false
    github_configuration_required = false
  }
]
