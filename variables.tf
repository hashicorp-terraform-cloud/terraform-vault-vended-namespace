variable "vault_parent_namespace_path_fq" {
  type    = string
  default = "vended"
}

variable "vault_namespace" {
  type = string
}

variable "az_tenant_id" {
  type = string
}

variable "az_subscription_id" {
  type    = string
  default = "11111111-2222-3333-4444-555555555555"
}

variable "az_client_id" {
  type = string
}

variable "az_client_secret" {
  type      = string
  sensitive = true
}

variable "az_aad_app_url" {
  type = string
}