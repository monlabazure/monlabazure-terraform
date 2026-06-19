# Convention de nommage Azure - MonLabAzure

## Objectif

Définir une convention de nommage simple, lisible et réutilisable pour les ressources Azure déployées avec Terraform.

## Format général

```text
<type>-<workload>-<environment>-<region>-<instance>
```

## Exemples

```text
rg-terraform-dev-frc-001
vnet-platform-dev-frc-001
kv-security-dev-frc-001
sttfstatedevfrc001
```

## Abréviations des types de ressources

| Ressource | Préfixe |
|---|---|
| Resource Group | rg |
| Virtual Network | vnet |
| Subnet | snet |
| Network Security Group | nsg |
| Public IP | pip |
| Network Interface | nic |
| Virtual Machine | vm |
| Storage Account | st |
| Key Vault | kv |
| Log Analytics Workspace | log |
| Private Endpoint | pep |
| Private DNS Zone | pdnsz |

## Environnements

| Environnement | Code |
|---|---|
| Développement | dev |
| Test | test |
| Production | prod |
| Sandbox | sbx |

## Régions

| Région Azure | Code court |
|---|---|
| France Central | frc |
| West Europe | weu |
| North Europe | neu |

## Règles importantes

- Utiliser des noms en minuscules autant que possible
- Éviter les caractères spéciaux
- Respecter les contraintes spécifiques de chaque service Azure
- Les Storage Accounts doivent utiliser uniquement des lettres minuscules et des chiffres
- Les noms doivent rester lisibles et prévisibles
