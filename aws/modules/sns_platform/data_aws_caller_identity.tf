data "aws_caller_identity" "current" {}

output "account_id" {
  value = var.account_id != null ? var.account_id : data.aws_caller_identity.current.account_id
}
