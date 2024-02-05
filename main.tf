terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.88.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.4.1"
    }
  }

  backend "azurerm" {
    resource_group_name  = "et-practice-rbe"
    storage_account_name = "etrbetf"
    container_name       = "rbe-terraform"
    key                  = "tf.sandbox.terraform.state"
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = "East US 2"
  
}

#ACR Init

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = true
}

#ACR End

#App Service Plan init

resource "azurerm_service_plan" "asp" {
  name                = var.asp_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = var.asp_sku
}

#App Service Plan End
resource "azurerm_application_insights" "appinsight" {
  name                = "${var.appservice_name}-insight"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  application_type    = "web"
}

#App Service with Registry init

resource "azurerm_linux_web_app" "appservice" {
  name                = var.appservice_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_service_plan.asp.location
  service_plan_id     = azurerm_service_plan.asp.id
  https_only          = true
  depends_on          = [azurerm_service_plan.asp]
  site_config {
    ftps_state    = "FtpsOnly"
    http2_enabled = true
  }

  app_settings = {
    APPINSIGHTS_INSTRUMENTATIONKEY             = azurerm_application_insights.appinsight.instrumentation_key
    APPLICATIONINSIGHTS_CONNECTION_STRING      = azurerm_application_insights.appinsight.connection_string
    ApplicationInsightsAgent_EXTENSION_VERSION = "~3"
  }
}

#App Service with Registry End