/**
# tf-aws-saml-sso

Creates an Identity Provider, assume role policy and default roles in IAM to be used for SSO.

### Example

* ```hcl
* module "google_sso" {
*   source             = "git@github.com:deliveryhero/tf-aws-saml-sso.git?ref=0.1"
*   idp_data_file_path = "path/to/GoogleIDPMetadata-my-domain.com.xml"
* }
* ```

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
*/
