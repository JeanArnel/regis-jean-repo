output "vm_locations" {
  value = { for vm in local.virtual_machines_config.virtual_machines : vm.name => vm.location }
  description = "The locations of the virtual machines"
}

output "vm_sizes" {
  value = { for vm in local.virtual_machines_config.virtual_machines : vm.name => vm.size }
  description = "The sizes of the virtual machines"
}

output "vm_environments" {
  value = { for vm in local.virtual_machines_config.virtual_machines : vm.name => vm.tags.environment }
  description = "The environments of the virtual machines"
}
