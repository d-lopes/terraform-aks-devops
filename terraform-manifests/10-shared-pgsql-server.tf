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

# Allow access to Azure services (so that we can expose this service in k8s)
resource "azurerm_postgresql_firewall_rule" "aks-access" {
  name                = "pgsql-${var.environment}-server-${var.environment}-aks-access"
  resource_group_name = azurerm_resource_group.aks_rg.name
  server_name         = azurerm_postgresql_server.pgsqlserver.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}