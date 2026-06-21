variable "application_name" {
  type        = string
  description = "Nom de l'application utilisée pour la démonstration des workspaces."
  default     = "workspace-demo"

  validation {
    condition     = can(regex("^[a-z0-9-]{3,30}$", var.application_name))
    error_message = "Le nom de l'application doit contenir entre 3 et 30 caractères : lettres minuscules, chiffres ou tirets."
  }
}
