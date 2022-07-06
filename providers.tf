terraform {
  cloud {
    organization = "martinkemp"

    workspaces {
      name = "martinkemp-do-tf"
    }
  }

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "~> 1"
    }
    flux = {
      source  = "fluxcd/flux"
      version = "~> 0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 4"
    }

  }
}

provider "digitalocean" {}

provider "cloudflare" {}

provider "kubernetes" {
  host                   = module.do_cluster.host
  token                  = module.do_cluster.token
  cluster_ca_certificate = module.do_cluster.cluster_ca_certificate
}

provider "kubectl" {
  host                   = module.do_cluster.host
  token                  = module.do_cluster.token
  cluster_ca_certificate = module.do_cluster.cluster_ca_certificate
}

provider "flux" {}

provider "github" {}
