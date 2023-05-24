terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "3.15.2"
    }
  }
}

provider "vault" {
  address = var.vault_public_endpoint_url
  token   = var.vault_token
}