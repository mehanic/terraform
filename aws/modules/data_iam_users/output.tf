# Output All IAM User ARNs and Names
output "all_user_arns" {
  description = "A list of ARNs for all IAM users."
  value       = data.aws_iam_users.all_users.arns
}

output "all_user_names" {
  description = "A list of names for all IAM users."
  value       = data.aws_iam_users.all_users.names
}

# Output Filtered IAM Users (Name Regex)
output "filtered_user_arns_by_name" {
  description = "A list of ARNs for IAM users matching the name regex."
  value       = data.aws_iam_users.filtered_users_by_name.arns
}

output "filtered_user_names_by_name" {
  description = "A list of names for IAM users matching the name regex."
  value       = data.aws_iam_users.filtered_users_by_name.names
}

# Output Filtered IAM Users (Path Prefix)
output "filtered_user_arns_by_path" {
  description = "A list of ARNs for IAM users under the specified path prefix."
  value       = data.aws_iam_users.filtered_users_by_path.arns
}

output "filtered_user_names_by_path" {
  description = "A list of names for IAM users under the specified path prefix."
  value       = data.aws_iam_users.filtered_users_by_path.names
}
