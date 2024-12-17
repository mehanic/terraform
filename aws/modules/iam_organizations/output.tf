output "organization_id" {
  description = "The ID of the AWS Organization."
  value       = aws_organizations_organization.example.id
}

output "enabled_features" {
  description = "The IAM Organizations features enabled for the root account."
  value       = aws_iam_organizations_features.example.enabled_features
}
