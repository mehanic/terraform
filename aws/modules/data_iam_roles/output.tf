# Output: All Role ARNs
output "all_role_arns" {
  description = "ARNs of all IAM roles"
  value       = data.aws_iam_roles.all_roles.arns
}

# Output: Project-related Role ARNs
output "project_role_arns" {
  description = "ARNs of IAM roles matching the project regex"
  value       = data.aws_iam_roles.project_roles.arns
}

# Output: Custom Path Role ARNs
output "custom_path_role_arns" {
  description = "ARNs of IAM roles under the custom path"
  value       = data.aws_iam_roles.custom_path_roles.arns
}

# Output: SSO Role ARNs
output "sso_role_arns" {
  description = "ARNs of IAM roles in the SSO reserved path"
  value       = data.aws_iam_roles.sso_roles.arns
}

# Output: Specific SSO Role ARNs
output "specific_sso_role_arns" {
  description = "ARNs of specific SSO-related IAM roles"
  value       = data.aws_iam_roles.specific_sso_roles.arns
}

# Formatted Output: Shortened ARNs
output "formatted_arns" {
  description = "Formatted short ARNs of all matched roles"
  value = [
    for parts in [for arn in data.aws_iam_roles.all_roles.arns : split("/", arn)] :
    format("%s/%s", parts[0], element(parts, length(parts) - 1))
  ]
}
