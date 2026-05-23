provider "azurerm" {
  features {}
}

# Define the resource group at the top level so both modules can use it
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Call the network module
module "network" {
  source              = "./Modules/network"
  resource_group_name = var.resource_group_name
  location           = var.location

  depends_on = [
azurerm_resource_group.rg
]
}

# Call the VM module
module "vm" {
  source              = "./Modules/vm"
 # Add any VM-specific variables here (e.g., vm_name, vm_size, etc.)
  resource_group_name = var.resource_group_name
  location = var.location
  admin_username = var.admin_username
  vm_image = var.vm_image
  vm_name = var.vm_name
  vm_size = var.vm_size
  admin_password = var.admin_password
  subnet_id = module.network.subnet_id
  depends_on = [
  azurerm_resource_group.rg,
  module.network
]
}