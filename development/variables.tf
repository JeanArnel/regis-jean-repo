variable "subscription_id"{
  type=string
}
variable "client_id"{
  type=string
}
variable "client_secret"{
  type=string
}
variable "tenant_id"{
  type=string
}

//
//

variable "prefix" {
  default = "tfvmex"
}

/*
variable "nameofmyazurermrg" {
  type = string
  default = "regis-jean-rg-test"
}
*/

//
//
// virtual network variables
//
//

variable "resource_group_name_network_name" {
  type = string
  default = "regis-jean-rg"
}

variable "resource_group_name_network_location" {
  type = string
  default = "canadacentral"
}




resource "azurerm_virtual_network" "main" {
  name                = "${var.prefix}-network"
  address_space       = ["10.0.0.0/16"]
//  location            = local.azurerm_resource_group.regis-jean-rg.location
//  location            = azurerm_resource_group.${var.regis-jean-rg}.location
//  resource_group_name = local.azurerm_resource_group.regis-jean-rg.name
  location            = azurerm_resource_group.regis-jean-rg.location
  resource_group_name = azurerm_resource_group.regis-jean-rg.name
}
