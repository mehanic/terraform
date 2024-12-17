resource "aws_iam_openid_connect_provider" "default" {
  url             = var.oidc_url
  client_id_list  = var.client_id_list
  thumbprint_list = var.thumbprint_list
  tags            = var.oidc_tags
}

# Find a Valid Thumbprint
# To generate a valid thumbprint:

# Download the certificate from the OIDC provider (e.g., https://accounts.google.com).
# Extract the thumbprint using OpenSSL:
# bash
# Copy code
# echo | openssl s_client -servername accounts.google.com -connect accounts.google.com:443 2>/dev/null | \
# openssl x509 -fingerprint -noout | tr -d ':'