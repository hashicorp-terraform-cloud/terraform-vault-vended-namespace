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
  resource      = var.az_aad_app_url
  namespace     = vault_namespace.vended-namespace.path_fq
}

resource "vault_azure_auth_backend_role" "azure" {
  backend                = vault_auth_backend.azure.path
  role                   = "${var.vault_namespace}-default-role"
  bound_subscription_ids = [var.az_subscription_id]
  token_ttl              = 3600
  token_max_ttl          = 86400
  token_policies         = ["${var.vault_namespace}-kv-policy", "${var.vault_namespace}-pki-policy"]
  namespace              = vault_namespace.vended-namespace.path_fq
}