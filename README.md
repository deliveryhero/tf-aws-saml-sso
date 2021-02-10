# tf-aws-saml-sso

Creates an Identity Provider, assume role policy and default roles in IAM to be used for SSO.

### Example

```hcl
module "google_sso" {
  saml_provider_name = "google"
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

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| extra\_policies\_administrator | Any extra policy ARNs to attach to the administrator role | `list` | `[]` | no |
| extra\_policies\_developer | Any extra policy ARNs to attach to the developer role | `list` | `[]` | no |
| extra\_policies\_ec2fullaccess | Any extra policy ARNs to attach to the EC2 full access role | `list` | `[]` | no |
| extra\_policies\_poweruser | Any extra policy ARNs to attach to the power user role | `list` | `[]` | no |
| extra\_policies\_readonly | Any extra policy ARNs to attach to the read only role | `list` | `[]` | no |
| extra\_policies\_sysadmin | Any extra policy ARNs to attach to the sysadmin role | `list` | `[]` | no |
| iam\_assume\_role\_extra\_identifiers | ARNs for additional federated identity providers that can assume the roles | `list` | `[]` | no |
| iam\_role\_path | Path of the IAM roles. | `string` | `"/sso/"` | no |
| iam\_role\_prefix | A string prefixed to all role names | `string` | `"sso-"` | no |
| idp\_data\_file\_path | Path to your IDP meta data file | `string` | n/a | yes |
| role\_max\_session\_duration | Max session duration in seconds | `string` | `"43200"` | no |
| saml\_provider\_name | Name of the provider. Visible in IAM console. | `string` | n/a | yes |
| tags | A map of tags to add to all resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| administrator\_role\_arn | Adminstrator role ARN |
| developer\_role\_arn | Developer role ARN |
| ec2fullaccess\_role\_arn | EC2 full access role ARN |
| poweruser\_role\_arn | Poweruser role ARN |
| readonly\_role\_arn | Read only role ARN |
| saml\_provider\_arn | ARN of the SAML provider |
| sysadmin\_role\_arn | Sysadmin role ARN |
