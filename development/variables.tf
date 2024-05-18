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

