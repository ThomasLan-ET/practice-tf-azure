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

module "rg" {
  source= "./module/resource-group"
  rg_name = "et-dev-sandbox"
  rg_location = "East US 2"
  rg_tags = {
    Owner = "Thomas"
    Env = "SandBox"
  }
}

module "acr" {
  source = "./module/acr"
  rg_resource = module.rg.rg_name
  location_resource = module.rg.rg_location
  acr_name = "sxregistrytfdev"

  tags_resource ={
    Owner = "Thomas"
    Env = "SandBox"
  }
}

module "sqlserver" {

  source = "./module/sql-server"
  sqlserver_name = "sxsqlstfdev"
  rg_resource = module.rg.rg_name
  location_resource = module.rg.rg_location

  tags_resource = {
    Owner = "Thomas"
    Env = "SandBox"
  }
}

module "sqlpool" {
  source = "./module/sql-pool"
  sqlpool_name = "sxpooldbtfdev"
  rg_resource = module.rg.rg_name
  location_resource = module.rg.rg_location
  sqlpool_servername = module.sqlserver.sqlserver_name

    tags_resource = {
    Owner = "Thomas"
    Env = "SandBox"
  }
}

module "asp" {
  source = "./module/app-service-plan"
  asp_name = "sxasptfdev"
  rg_resource = module.rg.rg_name
  location_resource = module.rg.rg_location
  depends_on = [ module.rg ]

  tags_resource = {
    Owner = "Thomas"
    Env = "SandBox"
  }
}