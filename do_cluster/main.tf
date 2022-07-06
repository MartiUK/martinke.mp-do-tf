data "digitalocean_kubernetes_versions" "k" {}

resource "digitalocean_kubernetes_cluster" "main" {
  name     = "main"
  region   = "lon1"
  version  = data.digitalocean_kubernetes_versions.k.latest_version
  vpc_uuid = var.vpc_uuid

  auto_upgrade  = true
  surge_upgrade = true

  node_pool {
    name       = "autoscale-worker-pool"
    size       = "s-2vcpu-2gb-amd"
    auto_scale = true
    min_nodes  = 1
    max_nodes  = 5
  }
}
