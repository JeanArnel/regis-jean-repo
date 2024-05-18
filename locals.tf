
locals {
  # Common tags for all resources
  common_tags = {
    environment = "staging"
  }

  # Common location for all resources
  location = "canadacentral"

  # Resource names
  resource_group_name = "${var.prefix}-resources"
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

# Then, you can reference these local values in your resources like this:
resource "azurerm_resource_group" "example" {
  name     = local.resource_group_name
  location = local.location
}

# ... and so on for the other resources.
