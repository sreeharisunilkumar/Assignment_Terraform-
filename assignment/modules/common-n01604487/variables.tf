variable "log_analytics_name" {
  description = "The name of the log analytics workspace"
  type        = string
  default     = "n01604487-law"  
}

variable "recovery_services_vault_name" {
  description = "The name of the recovery services vault"
  type        = string
  default     = "n01604487-rsv"
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
  default     = "n01604487sa"
}

variable "location" {
  description = "The location of the resources"
  type        = string
  default     = "Canada Central"
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "n01604487-RG"
}

variable "tags" {
  description = "Tags to be applied to the resources"
  type        = map(string)
  default = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "sreehari"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}
