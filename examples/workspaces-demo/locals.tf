locals {
  current_workspace = terraform.workspace

  workspace_settings = {
    default = {
      description = "Workspace par défaut créé automatiquement par Terraform"
      criticality = "low"
    }

    dev = {
      description = "Workspace de développement"
      criticality = "low"
    }

    test = {
      description = "Workspace de test"
      criticality = "medium"
    }

    prod = {
      description = "Workspace de production de lab"
      criticality = "high"
    }
  }

  current_settings = lookup(
    local.workspace_settings,
    local.current_workspace,
    {
      description = "Workspace non référencé explicitement"
      criticality = "unknown"
    }
  )

  common_labels = {
    Application = var.application_name
    Workspace   = local.current_workspace
    Criticality = local.current_settings.criticality
    ManagedBy   = "Terraform"
  }
}
