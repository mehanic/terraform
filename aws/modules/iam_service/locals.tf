locals {
  aws_service_names = setsubtract(var.aws_service_names, var.excluded_aws_service_names)
}