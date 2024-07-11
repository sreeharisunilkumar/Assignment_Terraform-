resource "azurerm_managed_disk" "datadisk" {
  count                = 4
  name                 = "${var.disk_names[count.index]}"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10

  tags = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "disk_attachment" {
  count                = 4
  managed_disk_id      = azurerm_managed_disk.datadisk[count.index].id
  virtual_machine_id   = var.vm_ids[count.index]
  lun                  = count.index
  caching              = "ReadWrite"
}
