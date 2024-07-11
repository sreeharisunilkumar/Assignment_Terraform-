variable "location" {
   type        = string
}

variable "resource_group_name" {
   type        = string
}

variable "vm_ids" {
   type        = list(string)
}

variable "disk_names" {
   type        = list(string)
}

variable "tags" {
   type        = map(string)
}
