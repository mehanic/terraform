output "oidc_provider_arn" {
  description = "The ARN of the OpenID Connect provider."
  value       = aws_iam_openid_connect_provider.default.arn
}

output "saml_provider_arn" {
  description = "The ARN assigned by AWS for the SAML provider."
  value       = aws_iam_saml_provider.default.arn
}

output "saml_provider_valid_until" {
  description = "The expiration date and time for the SAML provider."
  value       = aws_iam_saml_provider.default.valid_until
}
