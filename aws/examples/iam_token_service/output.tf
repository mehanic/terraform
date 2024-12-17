output "account_id" {
  description = "The AWS Account ID where the STS preferences are configured."
  value       = module.iam_token_service.account_id
}
