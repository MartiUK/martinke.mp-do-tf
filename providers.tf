terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "martinkemp"

    workspaces {
      name = "martinkemp-do-tf"
    }
  }

  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider digitalocean {}
