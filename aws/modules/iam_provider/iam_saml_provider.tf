resource "aws_iam_saml_provider" "default" {
  name = var.saml_provider_name
  //saml_metadata_document = file(var.saml_metadata_file)
  saml_metadata_document = var.saml_metadata_document
  tags                   = var.saml_tags
}
