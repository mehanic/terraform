module "lambda_alias" {
  source = "../../modules/lambda_alias"

  lambda_zip_file          = "../../examples/lambda_alias/my-python-lambda/lambda_function.zip"
  lambda_function_name     = "example_lambda_function"
  lambda_execution_role    = "arn:aws:iam::476167141852:role/lambda_execution_role"
  lambda_handler           = "lambda_function.lambda_handler"
  lambda_runtime           = "python3.9"
  lambda_alias_name        = "example_alias"
  lambda_alias_description = "Example Lambda alias"
  lambda_function_version  = "1"
}
