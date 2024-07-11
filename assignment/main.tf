module "rgroup" {
  source              = "./modules/rgroup-n01604487"
  resource_group_name = "n01604487-RGR"
  location            = "East US"
  tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "sreehari"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}
module "network" {
  source              = "./modules/network-n01604487"
  vnet_name           = "n01604487-VNET"
  subnet_name         = "n01604487-SUBNET"
  location            = module.rgroup.location
  vnet_address_space    = ["10.0.0.0/16"]
  subnet_address_prefix = ["10.0.1.0/24"]
  nsg_name              = "n01604487-nsg"
  resource_group_name = module.rgroup.resource_group_name
  tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "sreehari"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}
module "common" {
  source                       = "./modules/common-n01604487"
  recovery_services_vault_name = "n01604487-recovery"
  storage_account_name         = "n01604487storage"
  location                     = module.rgroup.location
  resource_group_name          = module.rgroup.resource_group_name
  tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "sreehari"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}

module "vmlinux_n01604487" {
  source                                = "./modules/vmlinux-n01604487"
  availability_set_name                 = "n01604487-linux-avset"
  location                              = module.rgroup.location
  resource_group_name                   = module.rgroup.resource_group_name
  vm_names                              = { "linux-n487vm1" = "vm1dns", 
                                            "linux-n487vm2" = "vm2dns", 
                                            "linux-n487vm3" = "vm3dns" }
  admin_username                        = "admin_user"
  subnet_id                             = module.network.subnet_id
  boot_diagnostics_storage_account_uri  = module.common.storage_account_primary_blob_endpoint
}
module "vmwindows_n01604487" {
  source                          = "./modules/vmwindows-n01604487"
  availability_set_name           = "n01604487-windows-avset"
  location                        = module.rgroup.location
  resource_group_name             = module.rgroup.resource_group_name
  admin_password                  = "Humber@1234"
  admin_username                  = "admin_user"
  subnet_id                       = module.network.subnet_id
  boot_diagnostics_storage_account_uri = module.common.storage_account_primary_blob_endpoint
  storage_account_type            = "Standard_LRS"
  tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "sreehari"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
 }
module "datadisk" {
  source              = "./modules/datadisk-n01604487"
  location            = module.rgroup.location
  resource_group_name = module.rgroup.resource_group_name
  vm_ids              = concat(module.vmlinux_n01604487.vm_ids, [module.vmwindows_n01604487.vm_id]) 
  disk_names          = ["datadisk1", "datadisk2", "datadisk3", "datadisk4"]
  tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "sreehari"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}
module "loadbalancer" {
  source              = "./modules/loadbalancer-n01604487"
  location            = module.rgroup.location
  resource_group_name = module.rgroup.resource_group_name
  load_balancer_name  = "n01604487-lb"
  vm_nic_ids          = module.vmlinux_n01604487.vm_nic_ids
  tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "sreehari"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}
module "database" {
  source              = "./modules/database-n01604487"
  resource_group_name = module.rgroup.resource_group_name
  location            = module.rgroup.location
  db_username         = "username"
  db_password         = "Humber@123"
}
