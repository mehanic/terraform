module "lambda_function_url" {
  source = "../../modules/lambda_function_url"
  function_name          = "my_lambda_function"
runtime  = "provided.al2023"
//lambda_execution_role  = "arn:aws:iam::123456789012:role/lambda_execution_role"
lambda_execution_role  = "arn:aws:iam::476167141852:role/my-lambda-role"
lambda_handler         = "main"
qualifier              = "my_alias"

cors_allow_origins     = ["https://example.com"]
cors_allow_methods     = ["GET", "POST", "OPTIONS"]  

cors_allow_headers     = ["date", "keep-alive"]
cors_expose_headers    = ["keep-alive", "date"]
cors_max_age           = 86400

environment_variables = {
  ENV_VAR_1 = "value1"
  ENV_VAR_2 = "value2"
}

}
