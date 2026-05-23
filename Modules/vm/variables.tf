variable "resource_group_name" {
type = string
}

variable "location" {
type = string
}

variable "vm_name" {

    description = "Name of the VM"
    type = string

}

variable "subnet_id" {
type = string
}

variable "vm_size" {

    description = "Size of the virtual machine"
    type = string
}

variable "admin_username" {

    description = "Admin username for VM"
    type = string

}

variable "vm_image" {

    description = "OS image for the Vm"
    type = string
}

variable "admin_password" {

    description = "Admin password for vm login"
    type = string
    sensitive = true
}