terraform {
  required_version = ">= 1.9.0, < 2.0.0"

  backend "azurerm" {}

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.7"
    }
  }
}
