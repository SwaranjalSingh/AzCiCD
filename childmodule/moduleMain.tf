module "swara-module" {
  source                      = "../parentmodule"
  name                        = var.modname
  location                    = var.modlocation
  account_tier                = var.modaccount_tier
  account_replication_type    = var.modaccount_replication_type
  enabled_for_disk_encryption = var.modenabled_for_disk_encryption
  soft_delete_retention_days  = var.modsoft_delete_retention_days
  purge_protection_enabled    = var.modpurge_protection_enabled
  sku_name                    = var.modsku_name
  os_type                     = var.modos_type
  service_plan_sku_name       = var.modservice_plan_sku_name
}
