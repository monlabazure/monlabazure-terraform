# Stratégie backend Terraform - MonLabAzure

## Objectif

Ce document décrit la stratégie de backend distant utilisée dans la série Terraform sur Azure.

## Problème du bootstrap

Terraform a besoin d’un state pour créer les ressources.

Le backend distant est lui-même une ressource Azure.

La solution retenue est donc :

```text
1. Créer le backend avec Terraform dans bootstrap/backend
2. Utiliser temporairement un state local
3. Migrer le state du bootstrap vers Azure Storage
4. Migrer les states des environnements vers Azure Storage
```

## Backend retenu

Le backend retenu est Azure Storage.

Structure :

```text
Resource Group backend
└── Storage Account backend
    └── Container tfstate
        ├── bootstrap/backend.terraform.tfstate
        ├── dev/01-first-deployment.terraform.tfstate
        ├── test/platform.terraform.tfstate
        └── prod/platform.terraform.tfstate
```

## Authentification

L’authentification utilisée dans le lab est basée sur :

```text
- Azure CLI
- Microsoft Entra ID
- Storage Blob Data Contributor
```

Le backend Terraform utilise :

```hcl
use_cli          = true
use_azuread_auth = true
```

## Règles de sécurité

- Ne pas versionner les vrais fichiers `backend.hcl`
- Versionner uniquement les fichiers `backend.hcl.example`
- Ne pas stocker d’access key dans Git
- Ne pas stocker de SAS token dans Git
- Activer TLS 1.2
- Désactiver l’accès public aux blobs
- Désactiver les shared keys
- Activer soft delete
- Activer container soft delete
- Activer blob versioning

## Convention de clés de state

```text
bootstrap/backend.terraform.tfstate
dev/01-first-deployment.terraform.tfstate
test/platform.terraform.tfstate
prod/platform.terraform.tfstate
```

## Points d’attention

Le state Terraform peut contenir des informations sensibles.

Il doit être protégé comme une donnée critique.
