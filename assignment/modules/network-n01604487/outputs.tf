output "vnet_name" {
  value = azurerm_virtual_network.network_n01604487.name
}

output "vnet_address_space" {
  value = azurerm_virtual_network.network_n01604487.address_space
}

output "subnet_name" {
  value = azurerm_subnet.subnetn01604487.name
}

output "subnet_address_prefix" {
  value = azurerm_subnet.subnetn01604487.address_prefixes
}

output "subnet_id" {
  value = azurerm_subnet.subnetn01604487.id
}

output "nsg_name" {
  value = azurerm_network_security_group.n01604487-nsg.name
}
