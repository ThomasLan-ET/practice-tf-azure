
resource "azurerm_mssql_server" "sqlserver" {
  name                         = var.sqlserver_name
  resource_group_name          = var.rg_resource
  location                     = var.location_resource
  version                      = var.sqlserver_version
  administrator_login          = var.sqlserver_admin_user
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"

  tags = var.tags_resource
}
