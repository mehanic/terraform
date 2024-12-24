module "data_iam_roles" {
  source         = "../../modules/data_iam_roles"
  aws_region     = "us-west-2"
  name_regex     = ".*example.*"
  path_prefix    = "/example-path"
  sso_name_regex = "AWSReservedSSO_AdminAccess_.*"


}
