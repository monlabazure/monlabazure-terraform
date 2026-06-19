<#
.SYNOPSIS
    Vérifie les outils nécessaires pour la série Terraform sur Azure.

.DESCRIPTION
    Ce script vérifie la présence de PowerShell, Winget, Azure CLI,
    Terraform CLI, Git et Visual Studio Code.

.NOTES
    Projet : MonLabAzure - Terraform sur Azure
#>

$ErrorActionPreference = "Continue"

function Test-Command {
    param (
        [Parameter(Mandatory = $true)]
        [string]$CommandName
    )

    $command = Get-Command $CommandName -ErrorAction SilentlyContinue

    if ($null -eq $command) {
        Write-Host "[ERREUR] $CommandName n'est pas installé ou n'est pas disponible dans le PATH." -ForegroundColor Red
        return $false
    }
    else {
        Write-Host "[OK] $CommandName détecté : $($command.Source)" -ForegroundColor Green
        return $true
    }
}

Write-Host "=== Vérification des outils MonLabAzure Terraform ===" -ForegroundColor Cyan
Write-Host ""

Write-Host "PowerShell version : $($PSVersionTable.PSVersion)" -ForegroundColor Green
Write-Host ""

Test-Command -CommandName "winget" | Out-Null
Test-Command -CommandName "az" | Out-Null
Test-Command -CommandName "terraform" | Out-Null
Test-Command -CommandName "git" | Out-Null
Test-Command -CommandName "code" | Out-Null

Write-Host ""
Write-Host "=== Versions détectées ===" -ForegroundColor Cyan

try {
    Write-Host ""
    Write-Host "Azure CLI :" -ForegroundColor Yellow
    az version
}
catch {
    Write-Host "Impossible d'afficher la version Azure CLI." -ForegroundColor Red
}

try {
    Write-Host ""
    Write-Host "Terraform :" -ForegroundColor Yellow
    terraform version
}
catch {
    Write-Host "Impossible d'afficher la version Terraform." -ForegroundColor Red
}

try {
    Write-Host ""
    Write-Host "Git :" -ForegroundColor Yellow
    git --version
}
catch {
    Write-Host "Impossible d'afficher la version Git." -ForegroundColor Red
}

try {
    Write-Host ""
    Write-Host "VS Code :" -ForegroundColor Yellow
    code --version
}
catch {
    Write-Host "Impossible d'afficher la version VS Code." -ForegroundColor Red
}

Write-Host ""
Write-Host "=== Vérification terminée ===" -ForegroundColor Cyan
