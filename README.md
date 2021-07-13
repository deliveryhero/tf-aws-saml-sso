# tf-aws-saml-sso

Creates an Identity Provider, assume role policy and default roles in IAM to be used for SSO.

### Example

```hcl
 module "google_sso" {
   source             = "git@github.com:deliveryhero/tf-aws-saml-sso.git?ref=0.1"
   idp_data = "<EntitiesDescriptor Name=...></EntitiesDescriptor>" or aws_secretsmanager_secret_version.example.secret_string
 }
```

### Setup with Google SAML

It is assumed that your G Suite Administrator has already setup the SAML provider and custom user attributes. If not, [here](https://medium.com/proud2becloud/single-sign-on-with-g-suite-on-the-amazon-web-services-console-d506fda88c90) is a guide. You need to obtain the `GoogleIDPMetadata` XML file from the G Suite Administrator.

The G Suite Administrator will also need to add attributes to each Google user in order to allow them access to roles within the AWS account. Once this is all complete, a new application called `Amazon Web Services` will be visible in your Google Apps list, top right corner of a Google app web page.

[aws-google-auth](https://github.com/cevoaustralia/aws-google-auth) is recommended for CLI/API access.

## Documentation generation

Documentation should be modified within `main.tf` and generated using [terraform-docs](https://github.com/segmentio/terraform-docs):

```bash
terraform-docs ./
```

## License
MIT Licensed. See [LICENSE](https://github.com/deliveryhero/tf-ssh-bastion/tree/master/LICENSE) for full details.

<!-- BEGIN_TF_DOCS -->


## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_administrator_role_arn"></a> [administrator\_role\_arn](#output\_administrator\_role\_arn) | Adminstrator role ARN |
| <a name="output_developer_role_arn"></a> [developer\_role\_arn](#output\_developer\_role\_arn) | Developer role ARN |
| <a name="output_ec2fullaccess_role_arn"></a> [ec2fullaccess\_role\_arn](#output\_ec2fullaccess\_role\_arn) | EC2 full access role ARN |
| <a name="output_poweruser_role_arn"></a> [poweruser\_role\_arn](#output\_poweruser\_role\_arn) | Poweruser role ARN |
| <a name="output_readonly_role_arn"></a> [readonly\_role\_arn](#output\_readonly\_role\_arn) | Read only role ARN |
| <a name="output_saml_provider_arn"></a> [saml\_provider\_arn](#output\_saml\_provider\_arn) | ARN of the SAML provider |
| <a name="output_sysadmin_role_arn"></a> [sysadmin\_role\_arn](#output\_sysadmin\_role\_arn) | Sysadmin role ARN |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_extra_policies_administrator"></a> [extra\_policies\_administrator](#input\_extra\_policies\_administrator) | Any extra policy ARNs to attach to the administrator role | `list(any)` | `[]` | no |
| <a name="input_extra_policies_developer"></a> [extra\_policies\_developer](#input\_extra\_policies\_developer) | Any extra policy ARNs to attach to the developer role | `list(any)` | `[]` | no |
| <a name="input_extra_policies_ec2fullaccess"></a> [extra\_policies\_ec2fullaccess](#input\_extra\_policies\_ec2fullaccess) | Any extra policy ARNs to attach to the EC2 full access role | `list(any)` | `[]` | no |
| <a name="input_extra_policies_poweruser"></a> [extra\_policies\_poweruser](#input\_extra\_policies\_poweruser) | Any extra policy ARNs to attach to the power user role | `list(any)` | `[]` | no |
| <a name="input_extra_policies_readonly"></a> [extra\_policies\_readonly](#input\_extra\_policies\_readonly) | Any extra policy ARNs to attach to the read only role | `list(any)` | `[]` | no |
| <a name="input_extra_policies_sysadmin"></a> [extra\_policies\_sysadmin](#input\_extra\_policies\_sysadmin) | Any extra policy ARNs to attach to the sysadmin role | `list(any)` | `[]` | no |
| <a name="input_iam_assume_role_extra_identifiers"></a> [iam\_assume\_role\_extra\_identifiers](#input\_iam\_assume\_role\_extra\_identifiers) | ARNs for additional federated identity providers that can assume the roles | `list(any)` | `[]` | no |
| <a name="input_iam_role_path"></a> [iam\_role\_path](#input\_iam\_role\_path) | Path of the IAM roles. | `string` | `"/sso/"` | no |
| <a name="input_iam_role_prefix"></a> [iam\_role\_prefix](#input\_iam\_role\_prefix) | A string prefixed to all role names | `string` | `"sso-"` | no |
| <a name="input_idp_data"></a> [idp\_data](#input\_idp\_data) | A string contained saml IDP metadata | `string` | n/a | yes |
| <a name="input_role_max_session_duration"></a> [role\_max\_session\_duration](#input\_role\_max\_session\_duration) | Max session duration in seconds | `string` | `"43200"` | no |
| <a name="input_saml_provider_name"></a> [saml\_provider\_name](#input\_saml\_provider\_name) | Name of the provider. Visible in IAM console. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources. | `map(string)` | `{}` | no |
<!-- END_TF_DOCS -->
