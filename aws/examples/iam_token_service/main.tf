module "iam_token_service" {
  source                        = "../../modules/iam_token_service"
  global_endpoint_token_version = "v2Token"

}
