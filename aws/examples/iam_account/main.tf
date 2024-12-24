module "iam_account" {
  source = "../../modules/iam_account"
  # Load Balancer IAM User Configuration
  aws_iam_access_user_name   = "aws_iam_access_user"        # Replace with your desired user name
  aws_iam_access_user_path   = "/system/"                   # Replace with the desired path
  aws_iam_access_pgp_key     = "keybase:valid_keybase_user" # Replace with a valid PGP key or Keybase username
  aws_iam_access_policy_name = "aws_iam_access_user-policy" # Replace with your desired policy name

  # Test User Configuration
  test_user_name = "aws_iam_access_user-test-user" # Replace with your desired test user name
  test_user_path = "/test/"                        # Replace with the desired path for the test user

  # Account Alias
  account_alias = "my-custom-account-alias" # Replace with your desired account alias

  # Password Policy Configuration
  minimum_password_length        = 20   # Minimum length for passwords
  require_lowercase_characters   = true # Set to false if lowercase characters are not required
  require_numbers                = true # Set to false if numbers are not required
  require_uppercase_characters   = true # Set to false if uppercase characters are not required
  require_symbols                = true # Set to false if symbols are not required
  allow_users_to_change_password = true # Set to false if password changes should not be allowed
  max_password_age               = 90   # Set the maximum password age in days
  password_reuse_prevention      = 5    # Set the number of previous passwords to prevent reuse

}
