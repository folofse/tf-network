module "montern_se" {
  source = "../modules/hosted-zone"

  domain_name   = "montern.se"
  transfer_lock = false // Not supported by .se

  admin_contact      = var.default_contact
  registrant_contact = var.default_contact
  tech_contact       = var.default_contact

  admin_contact_extra_params = {
    SE_ID_NUMBER  = "[SE]830512-4615",
    BIRTH_COUNTRY = "SE"
  }
  registrant_contact_extra_params = {
    SE_ID_NUMBER  = "[SE]830512-4615"
    BIRTH_COUNTRY = "SE"
  }
  tech_contact_extra_params = {
    SE_ID_NUMBER  = "[SE]830512-4615"
    BIRTH_COUNTRY = "SE"
  }
}

resource "aws_route53_record" "google_spf" {
  zone_id         = module.montern_se.route53_zone_id
  name            = ""
  type            = "TXT"
  ttl             = 3600
  
  records = [
    "v=spf1 include:_spf.google.com ~all"
  ]
}

resource "aws_route53_record" "google_mx" {
  zone_id = aws_route53_zone.example.zone_id
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