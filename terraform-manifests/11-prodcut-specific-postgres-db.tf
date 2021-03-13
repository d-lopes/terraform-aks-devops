# Create project-specific PostgreSQL DB

resource "azurerm_postgresql_database" "projectdb" {
  name                = "projectdb"
  resource_group_name = azurerm_resource_group.aks_rg.name
  server_name         = azurerm_postgresql_server.pgsqlserver.name
  charset             = "UTF8"
  collation           = "English_United States.1252"

  # PostgreSQL DB Tags 
  tags = {
    Environment = var.environment
    Project = "Example Project"
  }
}