/*

variable "prefix" {
  default = "tfvmex"
}

resource "azurerm_resource_group" "example" {
  name     = "${var.prefix}-resources"
  location = "West Europe"
}

*/

resource "azurerm_virtual_network" "main" {
  name                = "${var.prefix}-network"
  address_space       = var.resource_group_name_network_address
//  location            = local.azurerm_resource_group.regis-jean-rg.location
//  location            = azurerm_resource_group.${var.regis-jean-rg}.location
//  resource_group_name = local.azurerm_resource_group.regis-jean-rg.name
  location            = var.resource_group_name_network_location
  resource_group_name = var.resource_group_name_network_name
}


resource "azurerm_subnet" "internal" {
  name                 = var.azurerm_subnet_name
  resource_group_name  = var.azurerm_subnet_name_resource_group_name
  virtual_network_name = var.azurerm_subnet_virtual_network_name
  address_prefixes     = var.azurerm_subnet_address_prefixes
}


resource "azurerm_network_interface" "main" {
  name                = "${var.prefix}-nic"
  location            = var.azurerm_network_interface_location
  resource_group_name = var.azurerm_network_interface_resource_group_name

  ip_configuration {
    name                          = var.azurerm_network_interface_ip_configuration_name
    subnet_id                     = var.azurerm_network_interface_ip_configuration_subnet_id
    private_ip_address_allocation = var.azurerm_network_interface_rivate_ip_address_allocation
  }
}




























resource "azurerm_virtual_machine" "main" {
  name                  = "${var.prefix}-vm"
  location              = azurerm_resource_group.regis-jean-rg.location
  resource_group_name   = azurerm_resource_group.regis-jean-rg.name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = "Standard_DS1_v2"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
}
