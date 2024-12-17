terraform {
  required_version = "1.10.0"
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

module "iam_service" {
  source = "../../modules/iam_service"

  aws_service_names = [
    "access-analyzer.amazonaws.com",
    "accountdiscovery.ssm.amazonaws.com",
    "appmesh.amazonaws.com",
    "appstream.application-autoscaling.amazonaws.com",
    "autoscaling-plans.amazonaws.com",
  ]

  excluded_aws_service_names = [
    "access-analyzer.amazonaws.com",
  ]
  # aws_service_name = "other-service.amazonaws.com"
  # custom_suffix    = "my-custom-suffix"
  # description      = "Service-linked role for another service"
}
