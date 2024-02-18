resource "azurerm_service_plan" "asp" {
  name                = var.asp_name
  resource_group_name = var.rg_resource
  location            = var.location_resource
  os_type             = "Linux"
  sku_name            = var.asp_sku
}