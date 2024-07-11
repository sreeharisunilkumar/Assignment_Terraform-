resource "azurerm_availability_set" "vmwindows-avset" {
  name                = var.availability_set_name
  location            = var.location
  resource_group_name = var.resource_group_name
  platform_fault_domain_count = 2
  platform_update_domain_count = 5
  managed = true
}


resource "azurerm_public_ip" "vmwindows_pip" {
  name                = "vmwindows-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
}


resource "azurerm_network_interface" "vmwindows-nic" {
  name                = "vmwindows-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vmwindows_pip.id
  }

  tags = var.tags
}

resource "azurerm_windows_virtual_machine" "vmwindows-vm" {
  name                = "n01604487-vm"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_B1ms" 
  admin_username      = var.admin_username
  admin_password      = var.admin_password  
  provision_vm_agent  = true
  enable_automatic_updates = true
  network_interface_ids = [azurerm_network_interface.vmwindows-nic.id]
  availability_set_id = azurerm_availability_set.vmwindows-avset.id

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.storage_account_type
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  boot_diagnostics {
    storage_account_uri = var.boot_diagnostics_storage_account_uri
  }

  tags = var.tags
}

resource "azurerm_virtual_machine_extension" "vmwindows_antimalware" {
  name                     = "AntimalwareExtension"
  virtual_machine_id       = azurerm_windows_virtual_machine.vmwindows-vm.id
  publisher                = "Microsoft.Azure.Security"
  type                     = "IaaSAntimalware"
  type_handler_version     = "1.3"

settings = <<SETTINGS
    {
        "AntimalwareEnabled": true,
        "Exclusions": {
            "Extensions": ".log;.ldf",
            "Paths": "D:\\IISlogs;D:\\CustomFolder",
            "Processes": "mssence.svc"
        },
        "RealtimeProtectionEnabled": true,
        "ScheduledScanSettings": {
            "isEnabled": true,
            "scanType": "Quick",
            "day": "7",
            "time": "120"
        }
    }

  SETTINGS
  tags = var.tags
}
