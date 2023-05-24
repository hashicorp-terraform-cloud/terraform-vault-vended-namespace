output "namespace_path_fq" {
  value       = vault_namespace.vended-namespace.path_fq
  description = "the fully qualified path to the vault namespace"
}

output "azure_auth_path" {
  value       = vault_auth_backend.azure.path
  description = "the fully qualified path to the azure auth backend"
}

output "pki_secrets_path" {
  value       = vault_mount.pki.path
  description = "the fully qualified path to the pki secrets engine"
}

output "kv_secrets_path" {
  value       = vault_mount.static.path
  description = "the fully qualified path to the kv secrets engine"
}