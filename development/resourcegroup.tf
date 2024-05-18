resource "azurerm_resource_group" "regis-jean-rg" {
  name     = "regis-jean-rg-test"
  location = "canadacentral"
}

/*
resource "azurerm_resource_group" "regis-jean-rg" {
  name     = local.resource_group_name
  location = local.location
}
*/
