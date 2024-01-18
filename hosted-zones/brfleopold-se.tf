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
    "ns-210.awsdns-26.com",
    "ns-1638.awsdns-12.co.uk",
    "ns-1499.awsdns-59.org",
    "ns-992.awsdns-60.net"
  ]
}