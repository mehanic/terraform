# resource "null_resource" "build_go_binary" {
#   provisioner "local-exec" {
#     command = <<EOT
#       cd ../../examples/lambda_alias/my-python-lambda
      
#     EOT
#   }

#   # Trigger only if the Go source file changes
#   triggers = {
#     main_go_checksum = filemd5("../../examples/lambda_alias/my-python-lambda/python.py")
#   }
# }

# resource "null_resource" "zip_go_lambda" {
#   provisioner "local-exec" {
#     command = <<EOT
#       cd ../../examples/lambda_alias/my-python-lambda/python.py
#       zip function.zip main
#     EOT
#   }

#   depends_on = [null_resource.build_go_binary]

#   # Trigger only if the compiled binary changes
#   triggers = {
#     main_binary_checksum = filemd5("../../examples/lambda_alias/my-python-lambda/python.py")
#   }
# }


resource "null_resource" "zip_python_lambda" {
  provisioner "local-exec" {
    command = <<EOT
      cd ../../examples/lambda_alias/my-python-lambda
      ls -l    
      zip lambda_function.zip python.py
       ls -l   
    EOT
  }

  # Trigger only if the Python file changes
  triggers = {
    python_file_checksum = filemd5("../../examples/lambda_alias/my-python-lambda/python.py")
  }
}
