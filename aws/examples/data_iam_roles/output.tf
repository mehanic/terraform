output "project_role_arns" {
  value       = module.data_iam_roles.project_role_arns
}

# Output: Custom Path Role ARNs
output "custom_path_role_arns" {
  value       = module.data_iam_roles.custom_path_role_arns
}

# Output: SSO Role ARNs
output "sso_role_arns" {
  value       = module.data_iam_roles.sso_role_arns
}

# Output: Specific SSO Role ARNs
output "specific_sso_role_arns" {
  value       = module.data_iam_roles.specific_sso_role_arns
}

# Formatted Output: Shortened ARNs
output "formatted_arns" {
  value = module.data_iam_roles.formatted_arns
}
