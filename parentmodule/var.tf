variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "account_tier" {
  type = string
}

variable "account_replication_type" {
  type = string
}

variable "enabled_for_disk_encryption" {
  type = bool
}

variable "soft_delete_retention_days" {
  type = number
}

variable "purge_protection_enabled" {
  type = bool
}

variable "sku_name" {
  type = string
}

variable "os_type" {
  type = string
}

variable "service_plan_sku_name" {
  type = string
}