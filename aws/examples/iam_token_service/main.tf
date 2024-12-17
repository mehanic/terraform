terraform {
  required_version = "1.10.0"
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

module "iam_token_service" {
  source                        = "../../modules/iam_token_service"
  global_endpoint_token_version = "v2Token"

}
