terraform {
  required_version = "1.10.0"
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

module "data_iam_users" {
  source      = "../../modules/data_iam_users"
  name_regex  = ".*abc.*"
  path_prefix = "/custom-path"
}
