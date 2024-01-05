module "brf_leopold" {
  source = "../modules/hosted-zone"

  domain_name = "vikty.se"

  admin_contact      = var.default_contact
  registrant_contact = var.default_contact
  tech_contact       = var.default_contact
}