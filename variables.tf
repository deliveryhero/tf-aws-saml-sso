variable "idp_data" {
  type        = string
  description = "A string contained saml IDP metadata"
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
  type        = list(any)
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
  type        = list(any)
  description = "Any extra policy ARNs to attach to the administrator role"
  default     = []
}

variable "extra_policies_readonly" {
  type        = list(any)
  description = "Any extra policy ARNs to attach to the read only role"
  default     = []
}

variable "extra_policies_ec2fullaccess" {
  type        = list(any)
  description = "Any extra policy ARNs to attach to the EC2 full access role"
  default     = []
}

variable "extra_policies_sysadmin" {
  type        = list(any)
  description = "Any extra policy ARNs to attach to the sysadmin role"
  default     = []
}

variable "extra_policies_developer" {
  type        = list(any)
  description = "Any extra policy ARNs to attach to the developer role"
  default     = []
}

variable "extra_policies_poweruser" {
  type        = list(any)
  description = "Any extra policy ARNs to attach to the power user role"
  default     = []
}

variable "allow_explicit_sso_admin_users" {
  type        = boolean
  description = "Enable a trust relationship of the sso admin Role for certain user emails provided with allowed_sso_assume_policy_users"
  default     = false
}

variable "allowed_sso_admin_assume_policy_user_emails" {
  type        = list(string)
  description = "List of User Emails to explicitly allow using a sso admin role"
  default     = []
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}
