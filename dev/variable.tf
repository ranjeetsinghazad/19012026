variable "rgs" {
  type = map(object({
    name     = string
    location = string
    }
  ))

}
variable "azads" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string

  }))

}
variable "vnet5" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    address_space       = list(string)
  }))

}
variable "subnet5" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_space        = list(string)
  }))
}


variable "PIP5" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    allocation_method   = string
  }))

}