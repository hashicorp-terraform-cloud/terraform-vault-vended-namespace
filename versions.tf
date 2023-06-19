terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "3.15.2"
    }
    time = {
      source  = "hashicorp/time"
      version = "0.9.1"
    }
  }
}

provider "vault" {
}

provider "time" {}