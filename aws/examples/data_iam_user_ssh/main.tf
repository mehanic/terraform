terraform {
  required_version = "1.10.0"
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

module "data_iam_user_ssh" {
  source            = "../../modules/data_iam_user_ssh"
  username          = "test-user"
  ssh_public_key_id = "APKARUZ32GUTKIGARLXE"
  encoding          = "SSH"
}
