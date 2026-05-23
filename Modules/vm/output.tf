output "vm_name" {
  description = "The name of the virtual machine"
  value       = var.vm_name
}

output "vm_public_ip" {
  description = "The public IP address of the VM"
  value       = azurerm_public_ip.vm_ip.ip_address
}