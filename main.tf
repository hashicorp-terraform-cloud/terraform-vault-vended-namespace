resource "vault_namespace" "vended-namespace" {
  namespace = var.vault_parent_namespace_path_fq
  path      = var.vault_namespace
}

resource "vault_auth_backend" "azure" {
  type      = "azure"
  namespace = vault_namespace.vended-namespace.path_fq
}

resource "vault_azure_auth_backend_config" "azure" {
  backend       = vault_auth_backend.azure.path
  tenant_id     = var.az_tenant_id
  client_id     = var.az_client_id
  client_secret = var.az_client_secret
  resource      = var.az_aad_app
  namespace     = vault_namespace.vended-namespace.path_fq
}