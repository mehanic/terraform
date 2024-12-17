# Encrypted Secret Access Key for Load Balancer User
output "aws_iam_access_encrypted_secret" {
  description = "The encrypted secret access key for the load balancer user."
  value       = module.iam_account.aws_iam_access_encrypted_secret
}

# SES SMTP Password V4 for Test User
output "test_ses_smtp_password_v4" {
  description = "The SES SMTP password V4 for the test user."
  value       = module.iam_account.test_ses_smtp_password_v4
  sensitive   = true
}



# Load Balancer IAM User Details
output "aws_iam_access_user_name" {
  description = "The name of the IAM user for the load balancer."
  value       = module.iam_account.aws_iam_access_user_name
}

output "aws_iam_access_user_arn" {
  description = "The ARN of the IAM user for the load balancer."
  value       = module.iam_account.aws_iam_access_user_arn
}

# Load Balancer IAM Access Key Details
output "aws_iam_access_access_key_id" {
  description = "The access key ID for the load balancer user."
  value       = module.iam_account.aws_iam_access_access_key_id
}

# Load Balancer Policy Details
output "aws_iam_access_policy_name" {
  description = "The name of the IAM policy associated with the load balancer."
  value       = module.iam_account.aws_iam_access_policy_name
}

output "aws_iam_access_policy_document" {
  description = "The policy document applied to the load balancer user."
  value       = module.iam_account.aws_iam_access_policy_document
}

# Test User IAM Details
output "test_user_name" {
  description = "The name of the IAM user for testing."
  value       = module.iam_account.test_user_name
}

output "test_user_arn" {
  description = "The ARN of the IAM user for testing."
  value       = module.iam_account.test_user_arn
}

# Test User IAM Access Key Details
output "test_access_key_id" {
  description = "The access key ID for the test user."
  value       = module.iam_account.test_access_key_id
}

# Password Policy Details
output "password_policy_min_length" {
  description = "The minimum password length for the account password policy."
  value       = module.iam_account.password_policy_min_length
}

output "password_policy_require_lowercase" {
  description = "Whether the account password policy requires lowercase characters."
  value       = module.iam_account.password_policy_require_lowercase
}

output "password_policy_require_numbers" {
  description = "Whether the account password policy requires numbers."
  value       = module.iam_account.password_policy_require_numbers
}

output "password_policy_require_uppercase" {
  description = "Whether the account password policy requires uppercase characters."
  value       = module.iam_account.password_policy_require_uppercase
}

output "password_policy_require_symbols" {
  description = "Whether the account password policy requires symbols."
  value       = module.iam_account.password_policy_require_symbols
}

# Output the created account alias
output "account_alias" {
  description = "The alias set for the AWS account."
  value       = module.iam_account.account_alias
}
