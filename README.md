# tf-aws-saml-sso

Creates an Identity Provider, assume role policy and default roles in IAM to be used for SSO.

### Example

```hcl
module "google_sso" {
  source             = "git@github.com:deliveryhero/tf-aws-saml-sso.git?ref=0.1"
  idp_data_file_path = "path/to/GoogleIDPMetadata-my-domain.com.xml"
}
```

### Setup with Google SAML

It is assumed that your G Suite Administrator has already setup the SAML provider and custom user attributes. If not, [here](https://medium.com/proud2becloud/single-sign-on-with-g-suite-on-the-amazon-web-services-console-d506fda88c90) is a guide. You need to obtain the `GoogleIDPMetadata` XML file from the G Suite Administrator.

The G Suite Administrator will also need to add attributes to each Google user in order to allow them access to roles within the AWS account. Once this is all complete, a new application called `Amazon Web Services` will be visible in your Google Apps list, top right corner of a Google app web page.

[aws-google-auth](https://github.com/cevoaustralia/aws-google-auth) is recommended for CLI/API access.

## Documentation generation

Documentation should be modified within `main.tf` and generated using [terraform-docs](https://github.com/segmentio/terraform-docs):

```bash
terraform-docs md ./ | cat -s | tail -r | tail -n +2 | tail -r > README.md
```

## License
MIT Licensed. See [LICENSE](https://github.com/deliveryhero/tf-ssh-bastion/tree/master/LICENSE) for full details.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| extra_policies_administrator | Any extra policy ARNs to attach to the administrator role | list | `<list>` | no |
| extra_policies_developer | Any extra policy ARNs to attach to the developer role | list | `<list>` | no |
| extra_policies_ec2fullaccess | Any extra policy ARNs to attach to the EC2 full access role | list | `<list>` | no |
| extra_policies_poweruser | Any extra policy ARNs to attach to the power user role | list | `<list>` | no |
| extra_policies_readonly | Any extra policy ARNs to attach to the read only role | list | `<list>` | no |
| extra_policies_sysadmin | Any extra policy ARNs to attach to the sysadmin role | list | `<list>` | no |
| idp_data_file_path | Path to your IDP meta data file | string | - | yes |
| role_max_session_duration | Max session duration in seconds | string | `43200` | no |
| saml_provider_name | Name of the provider. Visible in IAM console. | string | `google` | no |

## Outputs

| Name | Description |
|------|-------------|
| administrator_role_arn | Adminstrator role ARN |
| developer_role_arn | Developer role ARN |
| ec2fullaccess_role_arn | EC2 full access role ARN |
| poweruser_role_arn | Poweruser role ARN |
| readonly_role_arn | Read only role ARN |
| saml_provider_arn | ARN of the SAML provider |
| sysadmin_role_arn | Sysadmin role ARN |
