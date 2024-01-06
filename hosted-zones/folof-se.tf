locals {
  override_default_contact = merge(var.default_contact, {
    email = "larsson.olof@gmail.com"
  })
}

module "folof_se" {
  source = "../modules/hosted-zone"

  domain_name   = "folof.se"
  transfer_lock = false // Not supported by .se

  admin_contact      = local.override_default_contact
  registrant_contact = local.override_default_contact
  tech_contact       = local.override_default_contact

  admin_contact_extra_params      = local.extra_params
  registrant_contact_extra_params = local.extra_params
  tech_contact_extra_params       = local.extra_params
}

resource "aws_route53_record" "folof_se_google_spf" {
  zone_id = module.folof_se.route53_zone_id
  name    = ""
  type    = "TXT"
  ttl     = 3600

  records = [
    "v=spf1 include:_spf.google.com ~all"
  ]
}

resource "aws_route53_record" "folof_se_google_mx" {
  zone_id = module.folof_se.route53_zone_id
  name    = ""
  type    = "MX"
  ttl     = 3600

  records = [
    "1 ASPMX.L.GOOGLE.COM",
    "5 ALT1.ASPMX.L.GOOGLE.COM",
    "5 ALT2.ASPMX.L.GOOGLE.COM",
    "10 ASPMX2.GOOGLEMAIL.COM",
    "10 ASPMX3.GOOGLEMAIL.COM",
  ]
}