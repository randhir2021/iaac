
variable "snet_dict" {
  #type        = list(map(string))
  description = "Subnets parameters"
  default     = null
}
variable "delegation" {
  description = "Subnet delegation to a service"
  type = object({
    name                       = string
    service_delegation_name    = string
    service_delegation_actions = list(string)
  })
  default = null
}
