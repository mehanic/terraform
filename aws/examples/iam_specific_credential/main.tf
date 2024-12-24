module "iam_specific_credential" {
  source = "../../modules/iam_specific_credential"
  region = "us-east-1"

  iam_user_name = "example"

  service_name = "codecommit.amazonaws.com"

  status = "Active"

}
