# Environnement prod

Ce dossier contient les futures configurations Terraform de l’environnement de production de lab.

## Rôle

Dans cette série, `prod` sera utilisé comme une production de lab.

Il servira à apprendre les bonnes pratiques de séparation, de validation et de déploiement contrôlé.

## Attention

Cet environnement n’est pas une production entreprise réelle.

Il sert uniquement dans le cadre pédagogique de MonLabAzure.

## Bonnes pratiques

- Utiliser un backend distant séparé
- Utiliser un state dédié
- Utiliser des variables dédiées
- Protéger les déploiements
- Ajouter une validation manuelle avant apply
- Restreindre les droits RBAC dans les TP avancés
- Surveiller le coût
- Nettoyer les ressources de lab inutiles
- Ne jamais tester directement une modification non validée dans prod
