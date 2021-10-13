data digitalocean_kubernetes_versions k {}

resource digitalocean_vpc main {
  name   = "main"
  region = "lon1"
  ip_range = "10.10.10.0/24"
}

resource digitalocean_kubernetes_cluster main {
  name    = "main"
  region  = "lon1"
  version = data.digitalocean_kubernetes_versions.k.latest_version
  vpc_uuid = digitalocean_vpc.main.id

  auto_upgrade = true
  surge_upgrade = true

  node_pool {
    name       = "autoscale-worker-pool"
    size       = "s-2vcpu-2gb-amd"
    auto_scale = true
    min_nodes  = 1
    max_nodes  = 5
  }
}
