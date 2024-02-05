output "rg_name" {
  description = "Resource Group Name"
  value       = azurerm_resource_group.rg.name
}

output "webapp_name" {
  description = "URL WebApp"
  value       = [azurerm_linux_web_app.appservice.*.name]
}

output "acr_name" {
  description = "ACR Name"
  value       = azurerm_container_registry.acr.name
}

output "acr_link" {
  description = "ACR Link Login"
  value       = azurerm_container_registry.acr.login_server
}

output "acr_usr" {
  description = "User for login"
  value       = azurerm_container_registry.acr.admin_username
}

output "acr_pass" {
  description = "Pass for login"
  value       = azurerm_container_registry.acr.admin_password
  sensitive   = true
}
