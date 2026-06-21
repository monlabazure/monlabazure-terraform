# Workspaces Demo

Cet exemple permet de comprendre les Terraform CLI workspaces avec un backend Azure Storage.

## Objectif

Tester les workspaces suivants :

```text
dev
test
prod
```

Chaque workspace possède son propre state.

## Commandes utiles

```powershell
terraform init -backend-config="backend.hcl"
terraform workspace list
terraform workspace new dev
terraform workspace select dev
terraform apply
terraform output
```

## Important

Cet exemple ne crée pas de ressource Azure applicative.

Il utilise uniquement le backend Azure Storage pour stocker les states Terraform.
