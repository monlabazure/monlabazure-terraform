output "resource_group_name" {
  description = "Nom du Resource Group du backend Terraform."
  value       = azurerm_resource_group.tfstate.name
}

output "storage_account_name" {
  description = "Nom du Storage Account du backend Terraform."
  value       = azurerm_storage_account.tfstate.name
}

output "storage_account_id" {
  description = "ID Azure du Storage Account du backend Terraform."
  value       = azurerm_storage_account.tfstate.id
}

output "container_name" {
  description = "Nom du container Blob du backend Terraform."
  value       = azurerm_storage_container.tfstate.name
}

output "tenant_id" {
  description = "Tenant ID Azure utilisé."
  value       = data.azurerm_client_config.current.tenant_id
}

output "subscription_id" {
  description = "Subscription ID Azure utilisée."
  value       = data.azurerm_client_config.current.subscription_id
}
