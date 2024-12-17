// 2 variant
resource "aws_iam_account_password_policy" "user_password_strict_rule" {
  minimum_password_length        = var.password_policies.minimum_password_length
  require_lowercase_characters   = var.password_policies.require_lowercase_characters
  require_numbers                = var.password_policies.require_numbers
  require_uppercase_characters   = var.password_policies.require_uppercase_characters
  require_symbols                = var.password_policies.require_symbols
  allow_users_to_change_password = var.password_policies.allow_users_to_change_password
  max_password_age               = var.password_policies.max_password_age
  password_reuse_prevention      = var.password_policies.password_reuse_prevention
}