terraform {
  required_version = "1.10.0"
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

module "data_session_context" {
  source     = "../../modules/data_session_context"
  aws_region = "us-east-1"

}
