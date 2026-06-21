# Stratégie de versions Terraform - MonLabAzure

## Objectif

Ce document décrit la stratégie de gestion des versions Terraform et providers dans le projet MonLabAzure.

## Version Terraform CLI

La contrainte utilisée est :

```hcl
required_version = ">= 1.9.0, < 2.0.0"
```

Objectif :

- Rester dans la branche Terraform 1.x
- Éviter une future version majeure 2.x sans validation
- Garder une compatibilité large avec les versions récentes de Terraform 1.x

## Providers principaux

### AzureRM

```hcl
version = "~> 4.0"
```

Objectif :

- Rester dans la branche majeure 4.x
- Éviter une future version majeure 5.x sans validation
- Accepter les mises à jour compatibles de la branche 4.x

### Random

```hcl
version = "~> 3.7"
```

### Time

```hcl
version = "~> 0.12"
```

## Lock file

Le fichier suivant doit être versionné :

```text
.terraform.lock.hcl
```

Il verrouille les versions exactes de providers sélectionnées par Terraform.

## Règles

- Ne pas supprimer `.terraform.lock.hcl` sans raison
- Ne pas modifier `.terraform.lock.hcl` manuellement
- Versionner `.terraform.lock.hcl`
- Ne pas versionner `.terraform/`
- Mettre à jour les providers dans une branche dédiée
- Toujours exécuter `terraform validate`
- Toujours exécuter `terraform plan`
- Relire les changements dans Git avant merge

## Mise à jour contrôlée des providers

Méthode recommandée :

```powershell
git checkout -b chore/update-terraform-providers
terraform init -upgrade
terraform validate
terraform plan
git diff
```

Puis créer une Pull Request.
