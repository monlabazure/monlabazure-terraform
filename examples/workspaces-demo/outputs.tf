output "current_workspace" {
  description = "Workspace Terraform actuellement actif."
  value       = local.current_workspace
}

output "workspace_description" {
  description = "Description associée au workspace courant."
  value       = local.current_settings.description
}

output "workspace_criticality" {
  description = "Niveau de criticité associé au workspace courant."
  value       = local.current_settings.criticality
}

output "workspace_suffix" {
  description = "Suffixe généré pour le workspace courant."
  value       = random_string.workspace_suffix.result
}

output "common_labels" {
  description = "Labels logiques calculés pour le workspace courant."
  value       = local.common_labels
}
