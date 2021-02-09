variable "idp_data_file_path" {
  type        = string
  description = "Path to your IDP meta data file"
}

variable "iam_role_prefix" {
  type        = string
  default     = "sso-"
  description = "A string prefixed to all role names"
}

variable "iam_role_path" {
  type        = string
  default     = "/sso/"
  description = "Path of the IAM roles."
}

variable "iam_assume_role_extra_identifiers" {
  type        = list
  default     = []
  description = "ARNs for additional federated identity providers that can assume the roles"
}

variable "saml_provider_name" {
  type        = string
  description = "Name of the provider. Visible in IAM console."
}

variable "role_max_session_duration" {
  type        = string
  default     = "43200"
  description = "Max session duration in seconds"
}

variable "extra_policies_administrator" {
  type        = list
  description = "Any extra policy ARNs to attach to the administrator role"
  default     = []
}

variable "extra_policies_readonly" {
  type        = list
  description = "Any extra policy ARNs to attach to the read only role"
  default     = []
}

variable "extra_policies_ec2fullaccess" {
  type        = list
  description = "Any extra policy ARNs to attach to the EC2 full access role"
  default     = []
}

variable "extra_policies_sysadmin" {
  type        = list
  description = "Any extra policy ARNs to attach to the sysadmin role"
  default     = []
}

variable "extra_policies_developer" {
  type        = list
  description = "Any extra policy ARNs to attach to the developer role"
  default     = []
}

variable "extra_policies_poweruser" {
  type        = list
  description = "Any extra policy ARNs to attach to the power user role"
  default     = []
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}
