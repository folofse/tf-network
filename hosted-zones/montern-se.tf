module "montern_se" {
  source = "../modules/hosted-zone"

  domain_name   = "montern.se"
  transfer_lock = false // Not supported by .se

  admin_contact      = var.default_contact
  registrant_contact = var.default_contact
  tech_contact       = var.default_contact

  admin_contact_extra_params      = local.extra_params
  registrant_contact_extra_params = local.extra_params
  tech_contact_extra_params       = local.extra_params
}

resource "aws_route53_record" "montern_se_google_spf" {
  zone_id = module.montern_se.route53_zone_id
  name    = ""
  type    = "TXT"
  ttl     = 3600

  records = [
    "v=spf1 include:_spf.google.com ~all"
  ]
}

resource "aws_route53_record" "montern_se_google_mx" {
  zone_id = module.montern_se.route53_zone_id
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