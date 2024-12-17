

# Load Balancer IAM User Details
output "aws_iam_access_user_name" {
  description = "The name of the IAM user for the load balancer."
  value       = aws_iam_user.aws_iam_access.name
}

output "aws_iam_access_user_arn" {
  description = "The ARN of the IAM user for the load balancer."
  value       = aws_iam_user.aws_iam_access.arn
}

# Load Balancer IAM Access Key Details
output "aws_iam_access_access_key_id" {
  description = "The access key ID for the load balancer user."
  value       = aws_iam_access_key.aws_iam_access.id
}

output "aws_iam_access_encrypted_secret" {
  description = "The encrypted secret access key for the load balancer user."
  value       = aws_iam_access_key.aws_iam_access.encrypted_secret
}

# Load Balancer Policy Details
output "aws_iam_access_policy_name" {
  description = "The name of the IAM policy associated with the load balancer."
  value       = aws_iam_user_policy.aws_iam_access_ro.name
}

output "aws_iam_access_policy_document" {
  description = "The policy document applied to the load balancer user."
  value       = aws_iam_user_policy.aws_iam_access_ro.policy
}

# Test User IAM Details
output "test_user_name" {
  description = "The name of the IAM user for testing."
  value       = aws_iam_user.test.name
}

output "test_user_arn" {
  description = "The ARN of the IAM user for testing."
  value       = aws_iam_user.test.arn
}

# Test User IAM Access Key Details
output "test_access_key_id" {
  description = "The access key ID for the test user."
  value       = aws_iam_access_key.test.id
}

output "test_ses_smtp_password_v4" {
  description = "The SES SMTP password V4 for the test user."
  value       = aws_iam_access_key.test.ses_smtp_password_v4
}

# Password Policy Details
output "password_policy_min_length" {
  description = "The minimum password length for the account password policy."
  value       = aws_iam_account_password_policy.strict.minimum_password_length
}

output "password_policy_require_lowercase" {
  description = "Whether the account password policy requires lowercase characters."
  value       = aws_iam_account_password_policy.strict.require_lowercase_characters
}

output "password_policy_require_numbers" {
  description = "Whether the account password policy requires numbers."
  value       = aws_iam_account_password_policy.strict.require_numbers
}

output "password_policy_require_uppercase" {
  description = "Whether the account password policy requires uppercase characters."
  value       = aws_iam_account_password_policy.strict.require_uppercase_characters
}

output "password_policy_require_symbols" {
  description = "Whether the account password policy requires symbols."
  value       = aws_iam_account_password_policy.strict.require_symbols
}

# Output the created account alias
output "account_alias" {
  description = "The alias set for the AWS account."
  value       = aws_iam_account_alias.alias.account_alias
}
