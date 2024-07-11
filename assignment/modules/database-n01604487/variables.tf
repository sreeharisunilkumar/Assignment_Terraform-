variable "resource_group_name" {
  description = "The name of the resource group where the resource will be deployed."
}

variable "location" {
  description = "The geographical region for deploying the resource."
}

variable "db_username" {
  description = "The administrator username for the database server."
}

variable "db_password" {
  description = "The administrator password for the database server."
}
