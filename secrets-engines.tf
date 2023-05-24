resource "vault_mount" "static" {
  path        = "static"
  type        = "kv"
  options     = { version = "2" }
  description = "static secret data for ${var.vault_namespace}"
  namespace   = vault_namespace.vended-namespace.path_fq
  depends_on  = [vault_namespace.vended-namespace]
}

# Hackity Hack
resource "time_sleep" "kv_wait_10_seconds" {
  depends_on      = [vault_mount.static]
  create_duration = "10s"
}

resource "vault_kv_secret_backend_v2" "static" {
  mount      = vault_mount.static.path
  namespace  = vault_namespace.vended-namespace.path_fq
  depends_on = [time_sleep.kv_wait_10_seconds]
}

resource "vault_mount" "pki" {
  path                      = "pki"
  type                      = "pki"
  default_lease_ttl_seconds = 3600
  max_lease_ttl_seconds     = 86400
  namespace                 = vault_namespace.vended-namespace.path_fq

}

resource "vault_pki_secret_backend_role" "role" {
  backend            = vault_mount.pki.path
  name               = "${var.vault_namespace}-default-role"
  ttl                = 86400
  allow_ip_sans      = true
  key_type           = "rsa"
  key_bits           = 4096
  allowed_domains    = ["onmi.cloud"]
  allow_subdomains   = true
  allow_glob_domains = true
  namespace          = vault_namespace.vended-namespace.path_fq
}