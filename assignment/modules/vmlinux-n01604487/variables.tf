variable "availability_set_name" {
  type        = string
}

variable "location" {
  type        = string
}

variable "resource_group_name" {
  type        = string
}

variable "vm_names" {
  type        = map(string)
}


variable "admin_username" {
  type        = string
}

variable "subnet_id" {
  type        = string
}

variable "boot_diagnostics_storage_account_uri" {
  type        = string
}

variable "public_key" {
  default     = "/home/N01604487/.ssh/id_rsa.pub"
}

variable "priv_key" {
  default     = "/home/N01604487/.ssh/id_rsa"
}

variable "os_info" {
  default = {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "8_2"
    version   = "latest"
  }
}

variable "os_disk" {
  default = {
    managed_disk_type    = "Standard_LRS"
    caching              = "ReadWrite"
  }
}


variable "tags" {
  type        = map(string)
  default = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "sreehari"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}
variable "unique_suffix" {
  description = "A unique suffix for DNS labels to avoid conflicts"
  type        = string
  default     = "n01604487"
}
