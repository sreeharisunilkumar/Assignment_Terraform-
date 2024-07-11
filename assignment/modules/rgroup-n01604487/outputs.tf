output "resource_group_name" {
  description = "The designation of the resource group"
  value       = azurerm_resource_group.rgroup-n01604487.name
}

output "location" {
  description = "Resource group's name"
  value       = var.location
}


