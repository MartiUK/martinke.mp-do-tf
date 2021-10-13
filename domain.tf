resource digitalocean_domain martinkemp {
  name = "martinke.mp"
}

module do-fm-dns-records {
  source = "martiuk/fastmail/digitalocean"

  domain = digitalocean_domain.martinkemp.name
  enable_subdomain_addresses = true
}

resource "digitalocean_record" "keybase" {
  domain = digitalocean_domain.martinkemp.name
  name   = "@"
  type   = "TXT"
  value  = "keybase-site-verification=98nLJnzb55C_7USM3IQUDfeKBD1YMMrh5rxVnaZRGjw"
}
