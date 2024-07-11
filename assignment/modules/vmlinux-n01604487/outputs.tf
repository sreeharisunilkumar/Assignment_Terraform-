output "linux_vm_hostname" {
  value = [for vm in azurerm_linux_virtual_machine.n01604487-vm : vm.computer_name]
}

output "vm_dns_labels" {
  value = [for pip in azurerm_public_ip.n01604487_pip : pip.domain_name_label]
}

output "linux_private_ip_address" {
  value = [for nic in azurerm_network_interface.n01604487-nic : nic.ip_configuration[0].private_ip_address]
}

output "linux_public_ip_address" {
  value = [for pip in azurerm_public_ip.n01604487_pip : pip.ip_address]
}
output "vm_ids" {
  value =  [for key, vm in azurerm_linux_virtual_machine.n01604487-vm : vm.id]
}
output "vm_nic_ids" {
  value = [for nic in azurerm_network_interface.n01604487-nic : nic.id]
}
