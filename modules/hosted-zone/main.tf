resource "aws_route53_zone" "zone" {
  name = var.domain_name
}

resource "aws_route53domains_registered_domain" "registered_domain" {
  domain_name = var.domain_name

  tags = var.tags

  dynamic "name_server" {
    for_each = aws_route53_zone.zone.name_servers
    content {
      name = name_server.value
    }
  }

  depends_on = [
    aws_route53_zone.zone
  ]

  admin_privacy      = var.admin_privacy
  registrant_privacy = var.registrant_privacy
  tech_privacy       = var.tech_privacy
  auto_renew         = var.auto_renew
  transfer_lock      = var.transfer_lock

  # contact_type == "PERSON"
  dynamic "admin_contact" {
    for_each = (var.admin_contact != {} && var.admin_contact.contact_type == "PERSON") ? [1] : []
    content {
      address_line_1 = var.admin_contact.address_line_1 != null ? var.admin_contact.address_line_1 : null
      address_line_2 = var.admin_contact.address_line_2 != null ? var.admin_contact.address_line_2 : null
      city           = var.admin_contact.city != null ? var.admin_contact.city : null
      state          = var.admin_contact.state != null ? var.admin_contact.state : null
      zip_code       = var.admin_contact.zip_code != null ? var.admin_contact.zip_code : null
      contact_type   = var.admin_contact.contact_type != null ? var.admin_contact.contact_type : null
      country_code   = var.admin_contact.country_code != null ? var.admin_contact.country_code : null
      email          = var.admin_contact.email != null ? var.admin_contact.email : null
      // extra_params   = var.admin_contact.extra_params != null ? var.admin_contact.extra_params : null
      fax          = var.admin_contact.fax != null ? var.admin_contact.fax : null
      first_name   = var.admin_contact.first_name != null ? var.admin_contact.first_name : null
      last_name    = var.admin_contact.last_name != null ? var.admin_contact.last_name : null
      phone_number = var.admin_contact.phone_number != null ? var.admin_contact.phone_number : null
    }
  }
  dynamic "registrant_contact" {
    for_each = (var.registrant_contact != {} && var.registrant_contact.contact_type == "PERSON") ? [1] : []
    content {
      address_line_1 = var.registrant_contact.address_line_1 != null ? var.registrant_contact.address_line_1 : null
      address_line_2 = var.registrant_contact.address_line_2 != null ? var.registrant_contact.address_line_2 : null
      city           = var.registrant_contact.city != null ? var.registrant_contact.city : null
      state          = var.registrant_contact.state != null ? var.registrant_contact.state : null
      zip_code       = var.registrant_contact.zip_code != null ? var.registrant_contact.zip_code : null
      contact_type   = var.registrant_contact.contact_type != null ? var.registrant_contact.contact_type : null
      country_code   = var.registrant_contact.country_code != null ? var.registrant_contact.country_code : null
      email          = var.registrant_contact.email != null ? var.registrant_contact.email : null
      // extra_params   = var.registrant_contact.extra_params != null ? var.registrant_contact.extra_params : null
      fax          = var.registrant_contact.fax != null ? var.registrant_contact.fax : null
      first_name   = var.registrant_contact.first_name != null ? var.registrant_contact.first_name : null
      last_name    = var.registrant_contact.last_name != null ? var.registrant_contact.last_name : null
      phone_number = var.registrant_contact.phone_number != null ? var.registrant_contact.phone_number : null
    }
  }
  dynamic "tech_contact" {
    for_each = (var.tech_contact != {} && var.tech_contact.contact_type == "PERSON") ? [1] : []
    content {
      address_line_1 = var.tech_contact.address_line_1 != null ? var.tech_contact.address_line_1 : null
      address_line_2 = var.tech_contact.address_line_2 != null ? var.tech_contact.address_line_2 : null
      city           = var.tech_contact.city != null ? var.tech_contact.city : null
      state          = var.tech_contact.state != null ? var.tech_contact.state : null
      zip_code       = var.tech_contact.zip_code != null ? var.tech_contact.zip_code : null
      contact_type   = var.tech_contact.contact_type != null ? var.tech_contact.contact_type : null
      country_code   = var.tech_contact.country_code != null ? var.tech_contact.country_code : null
      email          = var.tech_contact.email != null ? var.tech_contact.email : null
      // extra_params   = var.tech_contact.extra_params != null ? var.tech_contact.extra_params : null
      fax          = var.tech_contact.fax != null ? var.tech_contact.fax : null
      first_name   = var.tech_contact.first_name != null ? var.tech_contact.first_name : null
      last_name    = var.tech_contact.last_name != null ? var.tech_contact.last_name : null
      phone_number = var.tech_contact.phone_number != null ? var.tech_contact.phone_number : null
    }
  }
}

output "route53_zone_id" {
  value = aws_route53_zone.zone.id
}