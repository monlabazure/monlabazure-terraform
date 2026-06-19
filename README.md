# MonLabAzure - Terraform sur Azure

Ce dépôt contient les travaux pratiques de la série MonLabAzure consacrée à Terraform sur Azure.

## Objectif

Construire progressivement une mini Landing Zone Azure sécurisée avec Terraform.

## Structure du dépôt

```text
monlabazure-terraform/
├── environments/
│   ├── dev/
│   ├── test/
│   └── prod/
├── modules/
├── scripts/
├── docs/
├── README.md
└── .gitignore
```

## Prérequis

- PowerShell 7
- Winget
- Azure CLI
- Terraform CLI
- Git
- Visual Studio Code
- Une subscription Azure de lab

## Vérifier les outils

```powershell
.\scripts\check-tools.ps1
```

## Vérifier le contexte Azure

```powershell
az account show --output table
```

## Vérifier Terraform

```powershell
terraform version
```

## Bonnes pratiques

- Ne pas versionner les fichiers `*.tfvars`
- Ne pas versionner les fichiers `*.tfstate`
- Versionner `.terraform.lock.hcl`
- Toujours vérifier la subscription active avant un déploiement
- Toujours exécuter `terraform fmt` et `terraform validate`
