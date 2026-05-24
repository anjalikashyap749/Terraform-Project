terraform {
backend "azurerm" {
resource_group_name = "Backend-RG"
storage_account_name = "backendstorageacoount"
container_name = "statebackend"
key = "terraform.tfstate"
}
}