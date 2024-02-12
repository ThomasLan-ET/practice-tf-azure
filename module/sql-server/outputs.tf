output "sqlserver_name" {
  description = "Output SQL Server Name"
  value = azurerm_mssql_server.sqlserver.name
}

output "sqlserver_id" {
  description = "Output SQL Server ID"
  value = azurerm_mssql_server.sqlserver.id
}