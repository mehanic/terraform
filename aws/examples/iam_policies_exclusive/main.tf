terraform {
  required_version = "~> 1.0"
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

module "iam_policies_exclusive" {
  source       = "../../modules/iam_policies_exclusive"
  user_name    = "example-user"
  policy_names = ["example_inline_policy"]
}
