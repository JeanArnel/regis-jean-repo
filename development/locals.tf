
locals {
  # This creates a list of maps by decoding YAML files found in the specified directory.
  # It uses a fileset function to find all .yaml files that do not start with an underscore.
  virtualmachine_app = [
    for vm in fileset("${path.module}/configs", "[^_]*.yaml") : yamldecode(file("${path.module}/configs/${vm}"))
  ]

  # This flattens a list of lists into a single list.
  # It iterates over each 'app' in the previously created 'myregissql_app' list.
  # For each 'app', it attempts to iterate over 'listofmsqlapp' if it exists.
  # If 'listofmsqlapp' does not exist, it defaults to an empty list ([]).
  # For each 'mysqlapps' in 'listofmsqlapp', it creates a map with a single key 'name'.
  myregissql_app_list = flatten([
    for app in local.myregissql_app : [
      for mysqlapps in try(app.listofmsqlapp, []) : {
        name = mysqlapps.name
      }
    ]
  ])
}




locals {
  # Common tags for all resources
  common_tags = {
    environment = "staging"
  }

  # Common location for all resources
//  location = "canadacentral"

  # Resource names
  // resource_group_name = "${var.prefix}-resources"
//  resource_group_name = "regis-jean-rg-test"
  network_name        = "${var.prefix}-network"
  nic_name            = "${var.prefix}-nic"
  vm_name             = "${var.prefix}-vm"

  # Network configurations
  address_space = ["10.0.0.0/16"]
  subnet_prefix = ["10.0.2.0/24"]

  # VM configurations
  vm_size = "Standard_DS1_v2"
  os_publisher = "Canonical"
  os_offer     = "0001-com-ubuntu-server-jammy"
  os_sku       = "22_04-lts"
  os_version   = "latest"
}

/*
# Then, you can reference these local values in your resources like this:
resource "azurerm_resource_group" "example" {
  name     = local.resource_group_name
  location = local.location
}

# ... and so on for the other resources.
*/
