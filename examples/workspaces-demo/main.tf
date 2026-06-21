resource "random_string" "workspace_suffix" {
  length  = 6
  upper   = false
  lower   = true
  numeric = true
  special = false

  keepers = {
    workspace = terraform.workspace
  }
}
