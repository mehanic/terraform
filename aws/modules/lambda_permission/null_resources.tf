resource "null_resource" "zip_python_lambda" {
  provisioner "local-exec" {
    command = <<EOT
      cd ../../examples/lambda_permission/my-python-lambda
      ls -l
      zip -r lambda_function.zip python.py
      ls -l
    EOT
  }

  # Trigger only if the Python file changes
  triggers = {
    python_file_checksum = filemd5("../../examples/lambda_permission/my-python-lambda/python.py")
  }
}


resource "null_resource" "log_processor_lambda" {
  provisioner "local-exec" {
    command = <<EOT
      cd ../../examples/lambda_permission/log_processor_lambda
      ls -l
      zip -r log_processor_lambda.zip log_processor.py
      ls -l
    EOT
  }

  # Trigger only if the Python file changes
  triggers = {
    python_file_checksum = filemd5("../../examples/lambda_permission/log_processor_lambda/log_processor.py")
  }
}