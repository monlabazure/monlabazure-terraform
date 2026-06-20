# Structure du projet Terraform Azure - MonLabAzure

## Objectif

Ce document décrit l’organisation du dépôt Terraform utilisé dans la série MonLabAzure.

L’objectif est de garder une structure claire, progressive et adaptée à un lab Azure.

## Structure principale

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

## Dossier environments

Le dossier `environments` contient les configurations propres à chaque environnement.

```text
environments/
├── dev/
├── test/
└── prod/
```

Chaque environnement doit avoir son propre état Terraform.

Dans cette série, les environnements `dev`, `test` et `prod` seront utilisés.

## Dossier modules

Le dossier `modules` contient le code Terraform réutilisable.

Exemples futurs :

```text
modules/
├── resource-group/
├── storage-account/
├── network/
├── key-vault/
└── monitoring/
```

Un module doit avoir une responsabilité claire.

## Dossier docs

Le dossier `docs` contient la documentation interne du dépôt.

Exemples :

```text
docs/
├── naming-convention.md
├── tagging-strategy.md
├── project-structure.md
├── environment-strategy.md
├── git-github-strategy.md
└── promotion-strategy.md
```

## Dossier scripts

Le dossier `scripts` contient les scripts d’aide.

Exemples :

```text
scripts/
├── check-tools.ps1
└── check-azure-context.ps1
```

## Dossier examples

Le dossier `examples` contiendra des exemples d’utilisation des modules.

Il sera surtout utilisé quand les modules Terraform seront introduits.

## Dossier .github

Le dossier `.github` contiendra les workflows GitHub Actions et les fichiers liés à GitHub.

Exemple futur :

```text
.github/
├── workflows/
└── CODEOWNERS
```

## Fichiers Terraform standards

| Fichier | Rôle |
|---|---|
| `versions.tf` | Contraintes de version Terraform et providers |
| `providers.tf` | Configuration des providers |
| `variables.tf` | Variables d’entrée |
| `main.tf` | Ressources principales ou appels de modules |
| `locals.tf` | Valeurs calculées et conventions |
| `outputs.tf` | Valeurs de sortie |
| `data.tf` | Références vers des ressources existantes |
| `terraform.tfvars.example` | Exemple de valeurs d’environnement |

## Bonnes pratiques

- Séparer les environnements
- Utiliser un state séparé par environnement
- Séparer le code réutilisable dans des modules
- Ne pas versionner les fichiers `*.tfvars`
- Ne pas versionner les fichiers `*.tfstate`
- Versionner `.terraform.lock.hcl`
- Documenter les conventions du projet
- Garder les modules simples et lisibles
