# Environnement test

Ce dossier contient les futures configurations Terraform de l’environnement de test.

## Rôle

L’environnement `test` sert à valider le code Terraform avant promotion vers `prod`.

## Objectif

L’environnement `test` permettra de vérifier :

- Les modules Terraform
- Les variables par environnement
- Le backend séparé
- Les outputs
- Le comportement avant prod

## Bonnes pratiques

- Utiliser un state Terraform séparé
- Utiliser des variables spécifiques à l’environnement
- Ne pas partager le même fichier `terraform.tfvars` avec `dev`
- Ne pas utiliser la même clé de backend que `dev`
- Toujours relire le plan avant apply
