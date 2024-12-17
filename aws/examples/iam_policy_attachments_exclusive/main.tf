
terraform {
  required_version = "1.10.0"
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

module "iam_policy_attachments_exclusive" {
  source          = "../../modules/iam_policy_attachments_exclusive"
  user_name       = "example-user"
  policy_name     = "example-policy"
  attach_policies = true

}