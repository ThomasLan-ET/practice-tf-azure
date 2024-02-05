variable "resource_group_name" {
  type        = string
  description = "Name of Resource Group"
}

variable "acr_name" {
  type        = string
  description = "Name of Azure Container Registry"
}

variable "asp_name" {
  type        = string
  description = "Name of Azure Service Plan"
}

variable "asp_sku" {
  type        = string
  description = "SKU for Azure Service Plan"
}

variable "appservice_name" {
  type        = string
  description = "Name of App Service"
}

