module "lambda_provisioned_concurrency_config" {
  source                = "../../modules/lambda_provisioned_concurrency_config"
  lambda_execution_role = "arn:aws:iam::476167141852:role/my-lambda-role"
  //lambda_zip_path        = "lambda_function.zip"

  lambda_function_name              = "example_lambda_function"
  lambda_handler                    = "lambda_function.lambda_handler"
  lambda_alias_name                 = "example_alias"
  lambda_alias_description          = "Alias for the example function"
  provisioned_concurrent_executions = 2
  lambda_zip_file                   = "../../examples/lambda_alias/my-python-lambda/lambda_function.zip"

  //runtime_version_arn    = "arn:aws:lambda:us-east-1::runtime:provided.al2023"

}
