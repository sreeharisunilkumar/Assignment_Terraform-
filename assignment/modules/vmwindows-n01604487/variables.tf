variable "availability_set_name" {
   type        = string
}

variable "location" {
   type        = string
}

variable "resource_group_name" {
   type        = string
}

variable "admin_username" {
   type        = string
}

variable "admin_password" {
   type        = string
}

variable "subnet_id" {
   type        = string
}

variable "boot_diagnostics_storage_account_uri" {
   type        = string
}

variable "storage_account_type" {
   type        = string
}

variable "tags" {
   type        = map(string)
}
