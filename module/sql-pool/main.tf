resource "azurerm_mssql_elasticpool" "sqlpool" {
  name                = var.sqlpool_name
  resource_group_name = var.rg_resource
  location            = var.location_resource
  server_name         = var.sqlpool_servername
  max_size_gb         = var.sqlpool_sizegb

  sku {
    name     = var.sqlpool_sku.name
    tier     = var.sqlpool_sku.tier
    capacity = var.sqlpool_sku.capacity
  }

  per_database_settings {
    min_capacity = var.sqlpool_perdbsetting.min_capacity
    max_capacity = var.sqlpool_perdbsetting.max_capacity
  }

  tags = var.tags_resource
}