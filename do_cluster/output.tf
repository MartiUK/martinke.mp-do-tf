output "host" {
  value = digitalocean_kubernetes_cluster.main.endpoint
}
output "token" {
  value = digitalocean_kubernetes_cluster.main.kube_config[0].token
}
output "cluster_ca_certificate" {
  value = base64decode(digitalocean_kubernetes_cluster.main.kube_config[0].cluster_ca_certificate)
}
