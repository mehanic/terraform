module "lambda_function" {
  source = "../../modules/lambda_function"

  lambda_function_name = "my_lambda_function"

  lambda_handler = "index.handler"

  lambda_runtime = "python3.9"

  lambda_environment_variables = {
    foo = "bar"
  }

  subnet_ids = [
    "subnet-0be3f4bdb72e654cc",
    "subnet-0d8b91518cc85d002"
  ]

  security_group_ids = [
    "sg-048d59151ece5d272"
  ]

  lambda_timeout = 3

  lambda_memory_size = 128

  log_retention_days = 14

  lambda_source_file = "../../examples/lambda_function/my-python-lambda/python.py" # Replace with the actual path
  lambda_output_path = "lambda_function_payload.zip"                               # Replace with the desired output path


}

