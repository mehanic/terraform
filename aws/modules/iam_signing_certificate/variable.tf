# IAM User Name
variable "user_name" {
  description = "The name of the IAM user the signing certificate is for."
  type        = string
  default     = "example-user"
}

# Certificate File Path (PEM-encoded file)
variable "certificate_file_path" {
  description = "The path to the PEM-encoded certificate file."
  type        = string
  default     = "self-ca-cert.pem"
}

# Inline Certificate Content (PEM-encoded format)
variable "certificate_body_inline" {
  description = "The contents of the certificate in PEM-encoded format."
  type        = string
  default     = <<EOT
-----BEGIN CERTIFICATE-----
MIIDQTCCAimgAwIBAgITbXYZExampleCertificateBodyGenerated
-----END CERTIFICATE-----
EOT
}
