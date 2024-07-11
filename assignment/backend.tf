terraform {
  backend "azurerm" {
    resource_group_name  = "tfstaten01604487RG"
    storage_account_name = "tfstaten01604487sa"
    container_name       = "tfstatefiles"
    key                  = "tfstate"
  }
}
