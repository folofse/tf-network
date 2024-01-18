variable "admin_contact" {
  type        = map(string)
  description = "(Optional) Details about the domain administrative contact."
  default     = null
}

variable "admin_contact_extra_params" {
  type        = map(string)
  description = "(Optional) A key-value map of parameters required by certain top-level domains."
  default     = null
}

variable "admin_privacy" {
  type        = bool
  description = "(Optional) Whether domain administrative contact information is concealed from WHOIS queries. Default: true."
  default     = true
}

variable "auto_renew" {
  type        = bool
  description = "(Optional) Whether the domain registration is set to renew automatically. Default: true."
  default     = true
}

variable "domain_name" {
  type        = string
  description = "(Required) The name of the registered domain."
}

variable "domain_name_servers" {
  type        = list(string)
  description = "Name servers to other zone - will not create a new zone."
  default     = []
}

variable "registrant_contact" {
  type        = map(string)
  description = "(Optional) Details about the domain registrant."
  default     = null
}

variable "registrant_contact_extra_params" {
  type        = map(string)
  description = "(Optional) A key-value map of parameters required by certain top-level domains."
  default     = null
}

variable "registrant_privacy" {
  type        = bool
  description = "(Optional) Whether domain registrant contact information is concealed from WHOIS queries. Default: true."
  default     = true
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = null
}

variable "tech_contact" {
  type        = map(string)
  description = "(Optional) Details about the domain technical contact."
  default     = null
}

variable "tech_contact_extra_params" {
  type        = map(string)
  description = "(Optional) A key-value map of parameters required by certain top-level domains."
  default     = null
}

variable "tech_privacy" {
  type        = bool
  description = "(Optional) Whether domain technical contact information is concealed from WHOIS queries. Default: true."
  default     = true
}

variable "transfer_lock" {
  type        = bool
  description = "(Optional) Whether the domain is locked for transfer. Default: true."
  default     = true
}




/*
The admin_contact, registrant_contact and tech_contact objects support the following:

address_line_1 - (Optional) First line of the contact's address.
address_line_2 - (Optional) Second line of contact's address, if any.
city - (Optional) The city of the contact's address.
contact_type - (Optional) Indicates whether the contact is a person, company, association, or public organization. See the AWS API documentation for valid values.
country_code - (Optional) Code for the country of the contact's address. See the AWS API documentation for valid values.
email - (Optional) Email address of the contact.
extra_params - (Optional) A key-value map of parameters required by certain top-level domains.
fax - (Optional) Fax number of the contact. Phone number must be specified in the format "+[country dialing code].[number including any area code]".
first_name - (Optional) First name of contact.
last_name - (Optional) Last name of contact.
organization_name - (Optional) Name of the organization for contact types other than PERSON.
phone_number - (Optional) The phone number of the contact. Phone number must be specified in the format "+[country dialing code].[number including any area code]".
state - (Optional) The state or province of the contact's city.
zip_code - (Optional) The zip or postal code of the contact's address.

// Extra variables
SE_ID_NUMBER, FI_NATIONALITY, IT_PIN, CA_LEGAL_TYPE, BRAND_NUMBER, UK_CONTACT_TYPE, SG_ID_NUMBER, AU_ID_NUMBER, CA_LEGAL_REPRESENTATIVE, IT_NATIONALITY, AU_PRIORITY_TOKEN, BIRTH_DATE_IN_YYYY_MM_DD, FI_ORGANIZATION_TYPE, BIRTH_CITY, FI_BUSINESS_NUMBER, DOCUMENT_NUMBER, FI_ID_NUMBER, BIRTH_DEPARTMENT, DUNS_NUMBER, AU_ID_TYPE, EU_COUNTRY_OF_CITIZENSHIP, UK_COMPANY_NUMBER, CA_LEGAL_REPRESENTATIVE_CAPACITY, IT_REGISTRANT_ENTITY_TYPE, BIRTH_COUNTRY, CA_BUSINESS_ENTITY_TYPE, ES_IDENTIFICATION_TYPE, RU_PASSPORT_DATA, ES_LEGAL_FORM, VAT_NUMBER, ES_IDENTIFICATION
*/