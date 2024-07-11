output "common_log_analytics_name" {
  description = "The name of the log analytics workspace"
  value       = azurerm_log_analytics_workspace.n01604487-law.name
}

output "common_recovery_services_vault_name" {
  description = "The name of the recovery services vault"
  value       = azurerm_recovery_services_vault.n01604487-rsv.name
}

output "common_storage_account_name" {
  description = "The name of the storage account"
  value       = azurerm_storage_account.n01604487-sa.name
}

output "storage_account_primary_blob_endpoint" {
  value = azurerm_storage_account.n01604487-sa.primary_blob_endpoint
}
