variable "modname" {
  type = string
}
variable "modlocation" {
  type = string
}
variable "modaccount_tier" {
  type = string
}
variable "modaccount_replication_type" {
  type = string
}

variable "modenabled_for_disk_encryption" {
  type = bool
}

variable "modsoft_delete_retention_days" {
  type = number
}

variable "modpurge_protection_enabled" {
  type = bool
}

variable "modsku_name" {
  type = string
}

variable "modos_type" {
  type = string
}

variable "modservice_plan_sku_name" {
  type = string
}
