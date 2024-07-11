resource "azurerm_postgresql_server" "postgresql_server" {
  name                = "n01604487-postgres-server"
  location            = var.location
  resource_group_name = var.resource_group_name

  sku_name = "B_Gen5_1"

  storage_mb                   = 5120
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = false

  administrator_login          = var.db_username
  administrator_login_password = var.db_password
  version                      = "11"
  ssl_enforcement_enabled      = true
}

resource "azurerm_postgresql_database" "postgresql_database" {
  name                = "n01604487-postgres-db"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.postgresql_server.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}
