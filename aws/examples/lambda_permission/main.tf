module "lambda_permission" {
  source                   = "../../modules/lambda_permission"
  lambda_zip_file          = "../../examples/lambda_permission/my-python-lambda/lambda_function.zip" # Correct path
  lambda_function_name     = "my_lambda_function"
  lambda_handler           = "index.handler"
  lambda_runtime           = "python3.9"
  lambda_alias_name        = "my_alias"
  lambda_alias_description = "Alias for my Lambda function"
  // provisioned_concurrent_executions = 2
  cloudwatch_rule_arn = "arn:aws:iam::476167141852:role/cloudwatch_role"
  #   cloudwatch_log_group_name   = "/my-cloudwatch-log-group"
  #   filter_pattern              = ""
  sns_topic_name           = "my_sns_topic"
  url_permission_principal = "apigateway.amazonaws.com"
  source_account           = "476167141852"
}
