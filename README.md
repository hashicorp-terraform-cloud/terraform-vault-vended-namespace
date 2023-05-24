# terraform-vault-vended-namespace

This module serves as an example for how we can use no-code modules in Terraform Cloud / Enterprise to provide a self-service, 'vending machine' experience for creating and managing Vault Namespaces.

## Requirements

* An Azure AD Application with roles documented as per the [Azure Auth Method prerequisites](https://developer.hashicorp.com/vault/docs/auth/azure#prerequisites).
* A Token associated with a Vault identity with sufficient permissions to create namespaces, manage auth methods, and manage secrets engines.
