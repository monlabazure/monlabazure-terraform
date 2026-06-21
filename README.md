# MonLabAzure - Terraform sur Azure

Ce dépôt contient les travaux pratiques de la série MonLabAzure consacrée à Terraform sur Azure.

## Objectif

Construire progressivement une mini Landing Zone Azure sécurisée avec Terraform.

## Structure du dépôt

```text
monlabazure-terraform/
├── README.md
├── .gitignore
├── docs/
├── scripts/
├── environments/
├── modules/
├── examples/
└── .github/
```

## Dossiers principaux

| Dossier | Rôle |
|---|---|
| `docs/` | Documentation interne du dépôt |
| `scripts/` | Scripts d’aide PowerShell |
| `environments/` | Configurations par environnement |
| `modules/` | Modules Terraform réutilisables |
| `examples/` | Exemples d’utilisation des modules |
| `.github/` | Workflows GitHub Actions et configuration GitHub |

## Environnements

```text
environments/
├── dev/
├── test/
└── prod/
```

## Stratégie d’environnements

- `dev` : développement et tests rapides
- `test` : validation intermédiaire
- `prod` : production de lab

## GitHub

Le dépôt est versionné avec Git et synchronisé avec GitHub.

Commandes utiles :

```powershell
git status
git add .
git commit -m "Message du commit"
git push
```

## Prérequis

- PowerShell 7
- Winget
- Azure CLI
- Terraform CLI
- Git
- GitHub CLI
- Visual Studio Code
- Une subscription Azure de lab

## Vérifier les outils

```powershell
.\scripts\check-tools.ps1
```

## Vérifier le contexte Azure

```powershell
.\scripts\check-azure-context.ps1
```
## Backend Terraform

Le state Terraform est stocké dans Azure Storage à partir du TP 3.

Le backend est créé avec Terraform via :

```text
bootstrap/backend
```

Structure logique :

```text
tfstate/
├── bootstrap/backend.terraform.tfstate
├── dev/01-first-deployment.terraform.tfstate
├── test/platform.terraform.tfstate
└── prod/platform.terraform.tfstate
```

Les vrais fichiers `backend.hcl` ne sont pas versionnés.

Seuls les fichiers suivants sont versionnés :

```text
backend.hcl.example
```

Pour initialiser Terraform avec le backend distant :

```powershell
terraform init -backend-config="..\backend.hcl"
```

## Commandes Terraform utiles

```powershell
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform destroy
```

## Bonnes pratiques

- Ne pas versionner les fichiers `*.tfvars`
- Ne pas versionner les fichiers `*.tfstate`
- Ne pas versionner les vrais fichiers `backend.hcl`
- Versionner les fichiers `*.example`
- Versionner `.terraform.lock.hcl`
- Toujours vérifier la subscription active avant un déploiement
- Toujours lire le plan Terraform avant un apply
- Pousser le code validé vers GitHub
