resource "digitalocean_vpc" "main" {
  name     = "main"
  region   = "lon1"
  ip_range = "10.10.10.0/24"
}

module "do_cluster" {
  source   = "./do_cluster"
  vpc_uuid = digitalocean_vpc.main.id
}
