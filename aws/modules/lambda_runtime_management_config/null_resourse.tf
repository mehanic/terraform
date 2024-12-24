resource "null_resource" "build_go_binary" {
  provisioner "local-exec" {
    command = <<EOT
      cd ../../examples/lambda_runtime_management_config/my-go-lambda
      GOOS=linux GOARCH=amd64 go build -o main main.go
    EOT
  }

  # Trigger only if the Go source file changes
  triggers = {
    main_go_checksum = filemd5("../../examples/lambda_runtime_management_config/my-go-lambda/main.go")
  }
}

resource "null_resource" "zip_go_lambda" {
  provisioner "local-exec" {
    command = <<EOT
      cd ../../examples/lambda_runtime_management_config/my-go-lambda
      zip function.zip main
    EOT
  }

  depends_on = [null_resource.build_go_binary]

  # Trigger only if the compiled binary changes
  triggers = {
    main_binary_checksum = filemd5("../../examples/lambda_runtime_management_config/my-go-lambda/main")
  }
}
