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
  default = "regis-jean-rg-test"
}

variable "resource_group_name_network_location" {
  type = string
  default = "canadacentral"
}

variable "resource_group_name_network_address" {
  type = list(string)
  default = ["10.0.0.0/16"]
}

//
//
// virtual network subnet internals variables
//
//

variable "azurerm_subnet_name" {
  type = string
  default = "internal"
}

variable "azurerm_subnet_name_resource_group_name" {
  type = string
  default = "regis-jean-rg-test"
}

variable "azurerm_subnet_virtual_network_name" {
  type = string
  default = "main"
}

variable "azurerm_subnet_address_prefixes" {
  type = list(string)
  default = ["10.0.2.0/24"]
}

//
//
// azurerm network interface variables
//
//

variable "azurerm_network_interface_location" {
  type = string
  default = "canadacentral"
}

variable "azurerm_network_interface_resource_group_name" {
  type = string
  default = "regis-jean-rg-test"
}

variable "azurerm_network_interface_ip_configuration_name" {
  type = string
  default = "testconfiguration1"
}

variable "azurerm_network_interface_ip_configuration_subnet_id" {
  type = string
  default = azurerm_subnet.internal.id
}

variable "azurerm_network_interface_rivate_ip_address_allocation" {
  type = string
  default = "Dynamic"
}

/*
resource "azurerm_network_interface" "main" {
  name                = "${var.prefix}-nic"
  location            = azurerm_resource_group.regis-jean-rg.location
  resource_group_name = azurerm_resource_group.regis-jean-rg.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
  }
}
*/
