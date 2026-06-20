# Stratégie d’environnements - MonLabAzure Terraform

## Objectif

Ce document décrit l’utilisation des environnements `dev`, `test` et `prod` dans la série Terraform sur Azure.

## Environnements utilisés

```text
dev
test
prod
```

## Environnement dev

L’environnement `dev` sert à construire et tester rapidement.

Usage :

- Développement du code Terraform
- Validation initiale des ressources
- Tests rapides
- Nettoyage fréquent

## Environnement test

L’environnement `test` sert à valider avant promotion vers prod.

Usage :

- Validation intermédiaire
- Vérification des modules
- Vérification des variables
- Préparation de la promotion vers prod

## Environnement prod

L’environnement `prod` est utilisé dans cette série comme production de lab.

Il sert à apprendre les bonnes pratiques de production sans représenter une production entreprise réelle.

Usage :

- Simulation d’un environnement de production
- Déploiement contrôlé
- State séparé
- Variables séparées
- Validation du plan avant apply

## Règles communes

- Un dossier par environnement
- Un state par environnement
- Un fichier de variables par environnement
- Un backend par environnement
- Des noms de ressources distincts
- Des tags communs
- Un contrôle du coût
- Un nettoyage documenté
