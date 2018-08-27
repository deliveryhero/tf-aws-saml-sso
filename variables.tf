variable "idp_data_file_path" {
  type        = "string"
  description = "Path to your IDP meta data file"
}

variable "saml_provider_name" {
  type        = "string"
  default     = "google"
  description = "Name of the provider. Visible in IAM console."
}

variable "role_max_session_duration" {
  type        = "string"
  default     = "43200"
  description = "Max session duration in seconds"
}

variable "extra_policies_administrator" {
  type        = "list"
  description = "Any extra policy ARNs to attach to the administrator role"
  default     = []
}

variable "extra_policies_readonly" {
  type        = "list"
  description = "Any extra policy ARNs to attach to the read only role"
  default     = []
}

variable "extra_policies_ec2fullaccess" {
  type        = "list"
  description = "Any extra policy ARNs to attach to the EC2 full access role"
  default     = []
}

variable "extra_policies_sysadmin" {
  type        = "list"
  description = "Any extra policy ARNs to attach to the sysadmin role"
  default     = []
}

variable "extra_policies_developer" {
  type        = "list"
  description = "Any extra policy ARNs to attach to the developer role"
  default     = []
}

variable "extra_policies_poweruser" {
  type        = "list"
  description = "Any extra policy ARNs to attach to the power user role"
  default     = []
}
