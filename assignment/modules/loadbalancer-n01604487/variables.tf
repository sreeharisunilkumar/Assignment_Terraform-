variable "location" {
   type        = string
}

variable "resource_group_name" {
   type        = string
}

variable "load_balancer_name" {
   type        = string
}

variable "vm_nic_ids" {
   type        = list(string)
}

variable "tags" {
   type        = map(string)
}
