resource "azurerm_virtual_network" "my_network" {

	name = "my-vnet"
	address_space = ["10.0.0.0/16"]
	location = "Central India"
	resource_group_name = var.resource_group_name

}

resource "azurerm_subnet" "my_subnet" {
name                 = "my-subnet"
resource_group_name  = var.resource_group_name
virtual_network_name = azurerm_virtual_network.my_network.name
address_prefixes     = ["10.0.1.0/24"]
}

