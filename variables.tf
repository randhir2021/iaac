#-------------------------------------------------
# generic variables 
#-------------------------------------------------
variable "environment" {
  type        = string
  description = "Name of the env "
}
variable "extra_tags" {
  type = map(any)
}
variable "region" {
  type        = string
  description = "Region for deployment"
}
#-------------------------------------------------
# Confirmation on resource deployment 
#-------------------------------------------------
variable "DeployAzResourceGroup" {
  default = "No"
  type    = string
}
variable "DeployAzVirtualNetwork" {
  default = "No"
  type    = string
}
variable "DeployAzSubnet" {
  default = "No"
  type    = string
}

variable "DeployAzDataFactory" {
  default = "No"
  type    = string
}

#-------------------------------------------------
# Values for resource group variables 
#-------------------------------------------------
variable "rg_dict" {
  description = "name of resource groups"
  default     = null
}
#--------------------------------------
# Virtual Network variables 
#--------------------------------------
variable "vnet_dict" {
  description = "Virtual Network parameters"
  default     = null
}
variable "snet_dict" {
  description = "Subnets parameters"
  default     = null
}

#-------------------------------------------------
#  Data Factory variables 
#-------------------------------------------------

variable "adf_dict" {
  description = "name of Data factory"
  default     = null
}

