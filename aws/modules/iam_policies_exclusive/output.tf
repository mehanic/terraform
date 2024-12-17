# Output the IAM user name
output "iam_user_name" {
  description = "The IAM user name."
  value       = aws_iam_user.example.name
}

# # Output the inline policy names assigned to the user
# output "exclusive_policy_names" {
#   description = "List of inline policies exclusively assigned to the IAM user."
#   value       = aws_iam_user_policies_exclusive.example.policy_names
# }
