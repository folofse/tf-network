module "deniseaddario_se" {
  source = "../modules/hosted-zone"

  domain_name   = "deniseaddario.se"
  transfer_lock = false // Not supported by .se

  admin_contact      = var.default_contact
  registrant_contact = var.default_contact
  tech_contact       = var.default_contact

  admin_contact_extra_params      = local.extra_params
  registrant_contact_extra_params = local.extra_params
  tech_contact_extra_params       = local.extra_params
}