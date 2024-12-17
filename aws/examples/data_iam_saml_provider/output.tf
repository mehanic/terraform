# Output: SAML Provider Name
output "saml_provider_name" {
  description = "The name of the SAML provider."
  value       = module.data_iam_saml_provider.saml_provider_name
}

# Output: SAML Metadata Document
output "saml_metadata_document" {
  description = "The SAML metadata document of the provider."
  value       = module.data_iam_saml_provider.saml_metadata_document
}

# Output: SAML Provider Tags
output "saml_provider_tags" {
  description = "The tags associated with the SAML provider."
  value       = module.data_iam_saml_provider.saml_provider_tags
}

# Output: SAML Provider Valid Until
output "saml_provider_valid_until" {
  description = "The expiration date of the SAML provider."
  value       = module.data_iam_saml_provider.saml_provider_valid_until
}
