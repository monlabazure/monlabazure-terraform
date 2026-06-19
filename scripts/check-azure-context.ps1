<#
.SYNOPSIS
    Vérifie le contexte Azure actif avant d'exécuter Terraform.

.DESCRIPTION
    Ce script affiche l'utilisateur connecté, le tenant, la subscription active
    et vérifie que Azure CLI et Terraform sont disponibles.

.NOTES
    Projet : MonLabAzure - Terraform sur Azure
#>

Write-Host "=== Vérification Azure CLI ===" -ForegroundColor Cyan

try {
    $azCommand = Get-Command az -ErrorAction Stop
    Write-Host "Azure CLI détecté : $($azCommand.Source)" -ForegroundColor Green

    $azVersion = az version --output json | ConvertFrom-Json
    Write-Host "Version Azure CLI : $($azVersion.'azure-cli')"
}
catch {
    Write-Host "Azure CLI n'est pas disponible ou n'est pas dans le PATH." -ForegroundColor Red
    Write-Host "Correction recommandée : installer Azure CLI puis fermer et rouvrir PowerShell." -ForegroundColor Yellow
    exit 1
}

Write-Host ""
Write-Host "=== Vérification Terraform ===" -ForegroundColor Cyan

try {
    $terraformCommand = Get-Command terraform -ErrorAction Stop
    Write-Host "Terraform détecté : $($terraformCommand.Source)" -ForegroundColor Green
    terraform version
}
catch {
    Write-Host "Terraform n'est pas disponible ou n'est pas dans le PATH." -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "=== Vérification du compte Azure actif ===" -ForegroundColor Cyan

try {
    $account = az account show --output json | ConvertFrom-Json

    Write-Host "Compte connecté : $($account.user.name)" -ForegroundColor Green
    Write-Host "Tenant ID        : $($account.tenantId)"
    Write-Host "Subscription     : $($account.name)"
    Write-Host "Subscription ID  : $($account.id)"
    Write-Host "État             : $($account.state)"
}
catch {
    Write-Host "Aucun compte Azure actif. Exécutez d'abord : az login" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "=== Vérification terminée ===" -ForegroundColor Green
