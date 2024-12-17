terraform {
  required_version = "1.10.0"
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

module "iam_role_exclusive" {
  source       = "../../modules/iam_role_exclusive"
  role_name    = "my-custom-role"
  policy_names = ["custom-inline-policy-1", "custom-inline-policy-2"]

}
