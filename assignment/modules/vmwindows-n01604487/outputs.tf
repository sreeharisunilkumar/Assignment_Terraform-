output "vm_details" {
   value = {
    hostname       = azurerm_windows_virtual_machine.vmwindows-vm.computer_name
    private_ip     = azurerm_windows_virtual_machine.vmwindows-vm.private_ip_address
    public_ip      = azurerm_windows_virtual_machine.vmwindows-vm.public_ip_address
  }
}

output "vm_id" {
  value = azurerm_windows_virtual_machine.vmwindows-vm.id
}
