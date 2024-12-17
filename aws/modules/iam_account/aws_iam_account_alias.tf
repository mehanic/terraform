# Create an account alias for the AWS account
resource "aws_iam_account_alias" "alias" {
  account_alias = var.account_alias
}
