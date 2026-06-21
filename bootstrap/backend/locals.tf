locals {
  resource_group_name  = "rg-tfstate-${var.environment}-${var.location_short}-001"
  storage_account_name = "sttfstate${var.location_short}${random_string.storage_suffix.result}"

  common_tags = {
    Environment = var.environment
    Workload    = var.workload
    Owner       = var.owner
    ManagedBy   = "Terraform"
    Criticality = "high"
  }
}
