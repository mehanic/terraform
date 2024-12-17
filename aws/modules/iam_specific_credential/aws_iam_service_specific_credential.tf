resource "aws_iam_user" "example" {
  name = var.iam_user_name
}

resource "aws_iam_service_specific_credential" "service_specific_credential_example" {
  service_name = var.service_name
  user_name    = aws_iam_user.example.name
  status       = var.status
}