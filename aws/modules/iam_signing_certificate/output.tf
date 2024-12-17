# Output the ID of the first signing certificate
output "certificate_id_file" {
  description = "The ID of the signing certificate created from file."
  value       = aws_iam_signing_certificate.signing_certificate_test_cert.certificate_id
}

# Output the ID of the inline signing certificate
output "certificate_id_inline" {
  description = "The ID of the signing certificate created inline."
  value       = aws_iam_signing_certificate.signing_certificate_test_cert_inline.certificate_id
}

# Combined ID format (certificate_id:username)
output "certificate_combined_id" {
  description = "Combined ID in the format certificate_id:username for the inline cert."
  value       = aws_iam_signing_certificate.signing_certificate_test_cert_inline.id
}
