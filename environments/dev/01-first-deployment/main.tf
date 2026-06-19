resource "random_string" "storage_suffix" {
  length  = 5
  upper   = false
  lower   = true
  numeric = true
  special = false
}

locals {
  resource_group_name  = "rg-${var.workload_short}-${var.environment}-${var.location_short}-001"
  storage_account_name = "st${var.workload_short}${var.environment}${var.location_short}${random_string.storage_suffix.result}"

  common_tags = {
    Environment = var.environment
    Workload    = var.workload
    Owner       = var.owner
    ManagedBy   = "Terraform"
    CostCenter  = var.cost_center
    Criticality = "low"
  }
}

resource "azurerm_resource_group" "main" {
  name     = local.resource_group_name
  location = var.location

  tags = local.common_tags
}

resource "azurerm_storage_account" "main" {
  name                = local.storage_account_name
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  account_tier             = "Standard"
  account_replication_type = "LRS"

  min_tls_version                 = "TLS1_2"
  allow_nested_items_to_be_public = false
  public_network_access_enabled   = true

  tags = local.common_tags
}
