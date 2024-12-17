# Output the ARN of the IAM Server Certificate
output "server_certificate_arn" {
  description = "ARN of the IAM Server Certificate used by the ELB."
  value       = data.aws_iam_server_certificate.server_certificate.arn
}

# Output the name of the created ELB
output "elb_name" {
  description = "Name of the Elastic Load Balancer."
  value       = aws_elb.my_domain_elb.name
}
