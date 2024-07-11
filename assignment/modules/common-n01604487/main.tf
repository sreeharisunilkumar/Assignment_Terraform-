  resource "azurerm_recovery_services_vault" "n01604487-rsv" {
  name                = var.recovery_services_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard" 

  tags = var.tags
}

resource "azurerm_storage_account" "n01604487-sa" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = var.tags
}

resource "azurerm_log_analytics_workspace" "n01604487-law" {
  name                = var.log_analytics_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018" 

  tags = var.tags
}

