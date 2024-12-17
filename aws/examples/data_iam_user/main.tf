terraform {
  required_version = "1.10.0"
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

module "data_iam_user" {
  source    = "../../modules/data_iam_user"
  user_name = "main"
}
