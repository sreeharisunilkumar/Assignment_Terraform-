resource "azurerm_resource_group" "rgroup-n01604487" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}
