
variable "region" {
  type        = string
  description = "Region for deployment"
}
variable "vnet_dict" {
  description = "Virtual Network parameters"
  default     = null
}
variable "tags" {
  type = map(any)
}