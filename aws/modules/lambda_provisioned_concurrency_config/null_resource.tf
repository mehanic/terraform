resource "null_resource" "zip_python_lambda" {
  provisioner "local-exec" {
    command = <<EOT
      cd ../../examples/lambda_provisioned_concurrency_config/my-python-lambda
      ls -l
      zip -r lambda_function.zip python.py
      ls -l
    EOT
  }

  # Trigger only if the Python file changes
  triggers = {
    python_file_checksum = filemd5("../../examples/lambda_provisioned_concurrency_config/my-python-lambda/python.py")
  }
}