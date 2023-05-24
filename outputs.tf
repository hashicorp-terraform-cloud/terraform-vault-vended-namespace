output "namespace_path_fq" {
  value       = vault_namespace.vended-namespace.path_fq
  description = "the fully qualified path to the newly-created vault namespace"
}

output "azure_auth_path" {
  value       = vault_auth_backend.azure.path
  description = "the fully qualified path to the newly-created azure auth backend"
}