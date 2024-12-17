output "server_certificate_arn" {
  description = "ARN of the IAM Server Certificate used by the ELB."
  value       = module.data_iam_server_certificate.server_certificate_arn
}

# Output the name of the created ELB
output "elb_name" {
  description = "Name of the Elastic Load Balancer."
  value       = module.data_iam_server_certificate.elb_name
}
