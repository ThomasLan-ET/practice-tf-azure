output "sqlpool_id" {
  description = "Output SQL DB ID"
  value = azurerm_mssql_elasticpool.sqlpool.id
}