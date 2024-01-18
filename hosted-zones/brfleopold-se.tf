module "brfleopold_se" {
  source = "../modules/hosted-zone"

  domain_name   = "brfleopold.se"
  transfer_lock = false // Not supported by .se

  admin_contact      = local.override_default_contact
  registrant_contact = local.override_default_contact
  tech_contact       = local.override_default_contact

  admin_contact_extra_params      = local.extra_params
  registrant_contact_extra_params = local.extra_params
  tech_contact_extra_params       = local.extra_params

  domain_name_servers = [
    "ns-1937.awsdns-50.co.uk.",
    "ns-684.awsdns-21.net.",
    "ns-57.awsdns-07.com.",
    "ns-1241.awsdns-27.org."
  ]
}