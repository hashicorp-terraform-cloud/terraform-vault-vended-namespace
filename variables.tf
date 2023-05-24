variable "vault_token" {
  type      = string
  sensitive = true
}

variable "vault_public_endpoint_url" {
  type = string
}

variable "vault_parent_namespace_path_fq" {
  type    = string
  default = "admin/vended"
}

variable "vault_namespace" {
  type = string
}

variable "az_tenant_id" {
  type = string
}

variable "az_client_id" {
  type = string
}

variable "az_client_secret" {
  type      = string
  sensitive = true
}

variable "az_aad_app" {
  type = string
}