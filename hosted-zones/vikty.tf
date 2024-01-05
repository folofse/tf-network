module "brf_leopold" {
  source = "../modules/hosted-zone"

  domain_name = "vikty.se"

  admin_contact      = var.default_contact
  registrant_contact = var.default_contact
  tech_contact       = var.default_contact

  admin_contact_extra_params = {
    "SE_ID_NUMBER" = "830512-4615"
  }
  registrant_contact_extra_params = {
    "SE_ID_NUMBER" = "830512-4615"
  }
  tech_contact_extra_params = {
    "SE_ID_NUMBER" = "830512-4615"
  }
}