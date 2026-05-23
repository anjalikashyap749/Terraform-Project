output "vnet_name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network.my_network.name
}

output "vnet_address_space" {
  description = "The address space of the virtual network"
  value       = azurerm_virtual_network.my_network.address_space
}

output "subnet_id" {
value = azurerm_subnet.my_subnet.id
}