variable "default_contact" {
  type        = map(string)
  description = "(Optional) Details about the domain administrative, registrant and tech contact."
  default = {
    address_line_1    = "Hjuviks bryggväg 18, lgh 1103",
    city              = "Torslanda"
    contact_type      = "COMPANY"
    country_code      = "SE"
    email             = "olof@folof.se"
    first_name        = "Olof"
    last_name         = "Larsson"
    organization_name = "FOLOF AB"
    phone_number      = "+46.731828742"
    zip_code          = "42340",
    address_line_2    = null
    fax               = null
    extra_params      = null
    state             = null
  }
}