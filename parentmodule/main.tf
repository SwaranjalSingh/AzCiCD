terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "swara" {
  name     = var.name
  location = var.location
}

resource "azurerm_storage_account" "swara" {
  name                     = var.name
  resource_group_name      = azurerm_resource_group.swara.name
  location                 = azurerm_resource_group.swara.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  tags = {
    ApplicationName = var.name
    Owner           = ""
    Client          = ""
  }
}


data "azurerm_client_config" "current" {} /*credentials data like tenant Id or subscription Id will retrieved by
this block. This data is required in creation of keyvault */

resource "azurerm_key_vault" "swara" {
  name                        = var.name
  location                    = azurerm_resource_group.swara.location
  resource_group_name         = azurerm_resource_group.swara.name
  enabled_for_disk_encryption = var.enabled_for_disk_encryption
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = var.soft_delete_retention_days
  purge_protection_enabled    = var.purge_protection_enabled
  sku_name                    = var.sku_name
}

resource "azurerm_service_plan" "swara" {
  name                = var.name
  resource_group_name = azurerm_resource_group.swara.name
  location            = azurerm_resource_group.swara.location
  os_type             = var.os_type
  sku_name            = var.service_plan_sku_name
}


resource "azurerm_windows_function_app" "swara" {
  name                       = var.name
  resource_group_name        = azurerm_resource_group.swara.name
  location                   = azurerm_resource_group.swara.location
  storage_account_name       = azurerm_storage_account.swara.name
  storage_account_access_key = azurerm_storage_account.swara.primary_access_key
  service_plan_id            = azurerm_service_plan.swara.id
  site_config {}
}
