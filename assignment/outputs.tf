output "resource_group_name" {
  value       = module.rgroup.resource_group_name
}

output "vnet_name" {
  value       = module.network.vnet_name
}

output "subnet_name" {
  value       = module.network.subnet_name
}

output "common_log_analytics_name" {
  value       = module.common.common_log_analytics_name
}

output "common_recovery_services_vault_name" {
  value       = module.common.common_recovery_services_vault_name
}

output "common_storage_account_name" {
  value       = module.common.common_storage_account_name
}

output "linux_vm_hostname" {
  value       = module.vmlinux_n01604487.linux_vm_hostname
}

output "linux_private_ip_address" {
  value       = module.vmlinux_n01604487.linux_private_ip_address
}

output "linux_public_ip_address" {
  value       = module.vmlinux_n01604487.linux_public_ip_address
}

output "vm_dns_labels" {
  value       = module.vmlinux_n01604487.vm_dns_labels
}
output "vm_id" {
  value = module.vmwindows_n01604487.vm_id
}

