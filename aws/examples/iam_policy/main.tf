terraform {
  required_version = "~> 1.0"
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

module "iam_policy" {
  source             = "../../modules/iam_policy"
  user_name          = "one-example-user"
  role_name          = "one-example-role"
  group_name         = "one-example-group"
  policy_name        = "one-example-policy"
  policy_description = "This is an example policy used for testing purposes."
  attachment_name    = "one-example-attachment"

}
