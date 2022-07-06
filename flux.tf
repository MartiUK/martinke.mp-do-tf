resource "tls_private_key" "main" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

data "flux_install" "main" {
  target_path = local.target_path
}

data "flux_sync" "main" {
  target_path = local.target_path
  url = github_repository.main.ssh_clone_url
  branch      = local.branch
}

resource "kubernetes_namespace" "flux_system" {
  metadata {
    name = "flux-system"
  }
  lifecycle {
    ignore_changes = [metadata[0].labels]
  }
}

resource "github_repository" "main" {
  name = local.repo_name
}
