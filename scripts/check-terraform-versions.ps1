<#
.SYNOPSIS
  Vérifie les versions Terraform et les fichiers versions.tf du projet MonLabAzure.

.DESCRIPTION
  Ce script affiche la version Terraform CLI installée,
  liste les fichiers versions.tf et liste les fichiers .terraform.lock.hcl.
#>

Write-Host "=== Terraform CLI version ===" -ForegroundColor Cyan
terraform version

Write-Host ""
Write-Host "=== versions.tf files ===" -ForegroundColor Cyan
Get-ChildItem -Recurse -Filter "versions.tf" |
  Select-Object FullName

Write-Host ""
Write-Host "=== .terraform.lock.hcl files ===" -ForegroundColor Cyan
Get-ChildItem -Recurse -Filter ".terraform.lock.hcl" |
  Select-Object FullName

Write-Host ""
Write-Host "=== Terraform providers by root module ===" -ForegroundColor Cyan

$rootModules = @(
  "bootstrap\backend",
  "environments\dev\01-first-deployment",
  "examples\workspaces-demo"
)

foreach ($module in $rootModules) {
  if (Test-Path $module) {
    Write-Host ""
    Write-Host "Module: $module" -ForegroundColor Yellow
    Push-Location $module

    if (Test-Path ".terraform") {
      terraform providers
    }
    else {
      Write-Host "Terraform is not initialized in this folder."
    }

    Pop-Location
  }
}
