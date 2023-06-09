resource "vault_policy" "kv-policy" {
  name = "${var.vault_namespace}-kv-policy"

  policy = <<EOT
path "static/data/*" {
  capabilities = ["read","list"]
}

EOT

  namespace = vault_namespace.vended-namespace.path_fq
}

resource "vault_policy" "pki-policy" {
  name = "${var.vault_namespace}-pki-policy"

  policy = <<EOT
path "pki/issue/*" {
  capabilities = ["read","create","list"]
}

EOT

  namespace = vault_namespace.vended-namespace.path_fq
}