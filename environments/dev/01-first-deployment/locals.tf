
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