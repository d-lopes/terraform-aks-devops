# Create shared PostgreSQL Server 

resource "azurerm_postgresql_server" "pgsqlserver" {
  name                = "pgsql-${var.environment}-server"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name

  administrator_login          = var.pgsql_admin_username
  administrator_login_password = var.pgsql_admin_password

  sku_name   = "GP_Gen5_2"
  version    = "11"
  storage_mb = 5120

  backup_retention_days        = 7
  geo_redundant_backup_enabled = true
  auto_grow_enabled            = true

  public_network_access_enabled    = false
  ssl_enforcement_enabled          = true
  ssl_minimal_tls_version_enforced = "TLS1_2"

  # PostgreSQL Server Tags 
  tags = {
    Environment = var.environment
  }
}