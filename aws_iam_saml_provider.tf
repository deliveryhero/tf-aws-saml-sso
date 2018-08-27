resource "aws_iam_saml_provider" "main" {
  name                   = "${var.saml_provider_name}"
  saml_metadata_document = "${file(var.idp_data_file_path)}"
}
