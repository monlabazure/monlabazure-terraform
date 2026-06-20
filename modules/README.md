# Modules Terraform

Ce dossier contiendra les modules Terraform réutilisables de la série MonLabAzure.

## Objectif

Un module Terraform permet de regrouper une logique réutilisable.

Exemples futurs :

```text
modules/
├── resource-group/
├── storage-account/
├── network/
├── key-vault/
└── monitoring/
```

## Structure recommandée d’un module

```text
module-name/
├── main.tf
├── variables.tf
├── outputs.tf
├── versions.tf
└── README.md
```

## Bonnes pratiques

- Un module doit avoir une responsabilité claire
- Un module doit être documenté
- Les variables doivent être typées
- Les outputs doivent être utiles
- Le module ne doit pas contenir de valeurs propres à un environnement
- Le module ne doit pas contenir de secrets
