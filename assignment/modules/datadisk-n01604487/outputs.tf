output "disk_ids" {
   value       = azurerm_managed_disk.datadisk[*].id
}

output "disk_attachments" {
   value       = azurerm_virtual_machine_data_disk_attachment.disk_attachment[*].id
}
