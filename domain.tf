resource "cloudflare_zone" "martinkemp" {
  zone = "martinke.mp"
  plan = "free"
}

module "do-fm-dns-records" {
  source                     = "martiuk/fastmail/cloudflare"
  version                    = "1.0.0"
  domain                     = cloudflare_zone.martinkemp.zone
  zone_id                    = cloudflare_zone.martinkemp.id
  enable_subdomain_addresses = true
}

resource "cloudflare_record" "keybase" {
  zone_id = cloudflare_zone.martinkemp.zone
  name    = "@"
  type    = "TXT"
  value   = "keybase-site-verification=98nLJnzb55C_7USM3IQUDfeKBD1YMMrh5rxVnaZRGjw"
}
