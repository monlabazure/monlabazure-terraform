# Stratégie Git et GitHub - MonLabAzure Terraform

## Objectif

Ce document décrit l’utilisation de Git et GitHub dans la série Terraform sur Azure.

## Repository GitHub

Le dépôt GitHub principal du lab est :

```text
monlabazure-terraform
```

Il est recommandé de le créer en privé.

## Branches

La branche principale est :

```text
main
```

Les travaux de TP seront réalisés dans des branches dédiées.

Exemples :

```text
feature/tp-2-project-structure
feature/tp-3-remote-backend
feature/tp-4-provider-versioning
```

## Workflow recommandé

```text
1. Créer une branche feature
2. Modifier le code
3. Exécuter les vérifications locales
4. Committer
5. Pousser vers GitHub
6. Créer une Pull Request
7. Relire
8. Merger vers main
```

## Commandes utiles

```powershell
git status
git checkout main
git pull
git checkout -b feature/nom-de-branche
git add .
git commit -m "Message clair"
git push -u origin feature/nom-de-branche
```

## Bonnes pratiques

- Ne pas pousser directement sur main lorsque les Pull Requests seront introduites
- Ne jamais pousser de fichiers sensibles
- Vérifier `git status` avant chaque commit
- Vérifier `git remote -v` avant le premier push
- Écrire des messages de commit clairs
- Garder un historique propre
