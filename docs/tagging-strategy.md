# Stratégie de tags Azure - MonLabAzure

## Objectif

Appliquer des tags cohérents sur les ressources Azure pour faciliter la gouvernance, le suivi des coûts et l’exploitation.

## Tags obligatoires

| Tag | Exemple | Description |
|---|---|---|
| Environment | dev | Environnement de la ressource |
| Workload | terraform-lab | Nom du workload |
| Owner | monlabazure | Responsable fonctionnel ou technique |
| ManagedBy | Terraform | Outil de gestion |
| CostCenter | lab | Centre de coût |
| Criticality | low | Niveau de criticité |

## Exemple Terraform

```hcl
common_tags = {
  Environment = "dev"
  Workload    = "terraform-lab"
  Owner       = "monlabazure"
  ManagedBy   = "Terraform"
  CostCenter  = "lab"
  Criticality = "low"
}
```

## Bonnes pratiques

- Tous les Resource Groups doivent avoir des tags
- Toutes les ressources qui supportent les tags doivent recevoir les tags communs
- Les tags doivent être définis dans des locals Terraform
- Les tags ne doivent pas contenir de secrets
- Les valeurs doivent être normalisées
