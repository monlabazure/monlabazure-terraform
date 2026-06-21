variable "subscription_id" {
  type        = string
  description = "ID de la subscription Azure utilisée pour créer le backend Terraform."

  validation {
    condition     = can(regex("^[0-9a-fA-F-]{36}$", var.subscription_id))
    error_message = "La variable subscription_id doit contenir un GUID Azure valide."
  }
}

variable "location" {
  type        = string
  description = "Région Azure du backend Terraform."
  default     = "francecentral"
}

variable "location_short" {
  type        = string
  description = "Code court de la région Azure."
  default     = "frc"

  validation {
    condition     = can(regex("^[a-z0-9]{2,6}$", var.location_short))
    error_message = "La variable location_short doit contenir entre 2 et 6 caractères en minuscules ou chiffres."
  }
}

variable "environment" {
  type        = string
  description = "Environnement logique du backend."
  default     = "shared"

  validation {
    condition     = contains(["shared"], var.environment)
    error_message = "Pour ce backend, la valeur attendue est shared."
  }
}

variable "workload" {
  type        = string
  description = "Nom du workload associé au backend."
  default     = "terraform-state"
}

variable "owner" {
  type        = string
  description = "Responsable du backend."
  default     = "monlabazure"
}

variable "container_name" {
  type        = string
  description = "Nom du container Blob qui stockera les states Terraform."
  default     = "tfstate"

  validation {
    condition     = can(regex("^[a-z0-9-]{3,63}$", var.container_name))
    error_message = "Le nom du container doit contenir entre 3 et 63 caractères : lettres minuscules, chiffres ou tirets."
  }
}

variable "soft_delete_days" {
  type        = number
  description = "Nombre de jours de rétention soft delete pour les blobs et containers."
  default     = 14

  validation {
    condition     = var.soft_delete_days >= 7 && var.soft_delete_days <= 365
    error_message = "La rétention doit être comprise entre 7 et 365 jours."
  }
}
