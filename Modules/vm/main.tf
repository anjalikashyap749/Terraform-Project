resource "azurerm_public_ip" "vm_ip" {
name                = "my-public-ip"
location            = var.location
resource_group_name = var.resource_group_name
allocation_method   = "Static"
}

resource "azurerm_network_interface" "my_nic" {
name                = "my-nic"
location            = var.location
resource_group_name = var.resource_group_name

ip_configuration {
name                          = "internal"
subnet_id                     = var.subnet_id
private_ip_address_allocation = "Dynamic"
public_ip_address_id          = azurerm_public_ip.vm_ip.id
}
}

resource "azurerm_storage_account" "my_storage" {
name                     = "anjalistorageaccount2026"
resource_group_name      = var.resource_group_name
location                 = var.location
account_tier             = "Standard"
account_replication_type = "LRS"
}

resource "azurerm_virtual_machine" "my_vm" {
name                  = var.vm_name
location              = var.location
resource_group_name   = var.resource_group_name
network_interface_ids = [azurerm_network_interface.my_nic.id]
vm_size               = var.vm_size

storage_os_disk {
name           = "${var.vm_name}-osdisk"
caching        = "ReadWrite"
create_option  = "FromImage"
disk_size_gb   = 30
}

storage_image_reference {
publisher = "Canonical"
offer     = var.vm_image
sku       = "18.04-LTS"
version   = "latest"
}

os_profile {
computer_name  = var.vm_name
admin_username = var.admin_username
admin_password = var.admin_password
}

os_profile_linux_config {
disable_password_authentication = false
}
}
