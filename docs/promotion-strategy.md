# Stratégie de promotion dev vers test vers prod

## Objectif

Ce document décrit la stratégie de promotion du code Terraform entre les environnements.

## Chaîne de promotion

```text
dev → test → prod
```

## Principe

Le code est d’abord testé dans `dev`.

Il est ensuite validé dans `test`.

Enfin, il est appliqué dans `prod` après relecture du plan.

## Étapes

```text
1. Développer dans dev
2. Valider le plan dev
3. Appliquer dev
4. Valider dans test
5. Appliquer test
6. Préparer le plan prod
7. Relire le plan prod
8. Appliquer prod uniquement après validation
```

## Règles pour prod

- Pas d’apply automatique au début
- Plan obligatoire
- Relecture obligatoire
- Variables séparées
- State séparé
- Nettoyage documenté
- Coût surveillé

## Évolution future

Dans les TP avancés, cette stratégie sera partiellement automatisée avec GitHub Actions.
