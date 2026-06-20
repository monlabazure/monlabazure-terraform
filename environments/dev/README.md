# Environnement dev

Ce dossier contient les configurations Terraform destinées à l’environnement de développement.

## Rôle

L’environnement `dev` sert à tester les ressources, les modules et les bonnes pratiques avant toute généralisation vers `test` ou `prod`.

## Contenu actuel

```text
dev/
├── 01-first-deployment/
├── backend.hcl.example
└── README.md
```

## Bonnes pratiques

- Vérifier la subscription Azure active avant chaque déploiement
- Ne jamais versionner `terraform.tfvars`
- Ne jamais versionner `terraform.tfstate`
- Toujours exécuter `terraform fmt`
- Toujours exécuter `terraform validate`
- Toujours lire `terraform plan` avant `terraform apply`
- Nettoyer les ressources inutiles
