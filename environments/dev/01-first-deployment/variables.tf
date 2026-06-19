variable "subscription_id" {
  type        = string
  description = "ID de la subscription Azure utilisée pour le déploiement Terraform."

  validation {
    condition     = can(regex("^[0-9a-fA-F-]{36}$", var.subscription_id))
    error_message = "La variable subscription_id doit contenir un ID de subscription Azure valide au format GUID."
  }
}

variable "environment" {
  type        = string
  description = "Nom court de l'environnement Azure."

  validation {
    condition     = contains(["dev", "test", "prod", "sbx"], var.environment)
    error_message = "La variable environment doit être dev, test, prod ou sbx."
  }
}

variable "location" {
  type        = string
  description = "Région Azure utilisée pour déployer les ressources."

  validation {
    condition     = length(var.location) > 0
    error_message = "La variable location ne peut pas être vide."
  }
}

variable "location_short" {
  type        = string
  description = "Code court de la région Azure."

  validation {
    condition     = can(regex("^[a-z0-9]{2,6}$", var.location_short))
    error_message = "La variable location_short doit contenir entre 2 et 6 caractères en minuscules ou chiffres."
  }
}

variable "workload" {
  type        = string
  description = "Nom fonctionnel du workload."

  validation {
    condition     = can(regex("^[a-z0-9-]{3,30}$", var.workload))
    error_message = "La variable workload doit contenir entre 3 et 30 caractères : lettres minuscules, chiffres ou tirets."
  }
}

variable "workload_short" {
  type        = string
  description = "Nom court du workload, utilisé pour les ressources avec contraintes strictes comme les Storage Accounts."

  validation {
    condition     = can(regex("^[a-z0-9]{3,10}$", var.workload_short))
    error_message = "La variable workload_short doit contenir entre 3 et 10 caractères : lettres minuscules ou chiffres uniquement."
  }
}

variable "owner" {
  type        = string
  description = "Responsable technique ou fonctionnel des ressources."

  validation {
    condition     = length(var.owner) >= 3
    error_message = "La variable owner doit contenir au moins 3 caractères."
  }
}

variable "cost_center" {
  type        = string
  description = "Centre de coût associé aux ressources."

  validation {
    condition     = length(var.cost_center) >= 2
    error_message = "La variable cost_center doit contenir au moins 2 caractères."
  }
}
