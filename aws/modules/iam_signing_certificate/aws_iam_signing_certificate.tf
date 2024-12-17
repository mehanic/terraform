# AWS IAM Signing Certificate with file input
resource "aws_iam_signing_certificate" "signing_certificate_test_cert" {
  user_name        = var.user_name
  certificate_body = file(var.certificate_file_path)
}

# AWS IAM Signing Certificate with inline certificate input
resource "aws_iam_signing_certificate" "signing_certificate_test_cert_inline" {
  user_name = var.user_name

  certificate_body = <<EOF
${var.certificate_body_inline}
EOF
}


//openssl req -newkey rsa:2048 -new -nodes -x509 -days 3650 -keyout key.pem -out test-user-cert.pem in certs/ generate