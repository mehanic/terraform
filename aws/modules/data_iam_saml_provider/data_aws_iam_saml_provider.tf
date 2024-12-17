
# Data Source: Fetch details of an IAM SAML provider
data "aws_iam_saml_provider" "example" {
  arn = var.saml_provider_arn
}