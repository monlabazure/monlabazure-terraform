output "resource_group_name" {
  description = "Nom du Resource Group créé."
  value       = azurerm_resource_group.main.name
}

output "resource_group_location" {
  description = "Région Azure du Resource Group."
  value       = azurerm_resource_group.main.location
}

output "storage_account_name" {
  description = "Nom du Storage Account créé."
  value       = azurerm_storage_account.main.name
}

output "storage_account_id" {
  description = "ID Azure Resource Manager du Storage Account."
  value       = azurerm_storage_account.main.id
}
