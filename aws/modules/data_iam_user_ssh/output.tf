# Output SSH Key Fingerprint
output "ssh_key_fingerprint" {
  description = "MD5 message digest of the SSH public key."
  value       = data.aws_iam_user_ssh_key.example.fingerprint
}

# Output SSH Public Key
output "ssh_public_key" {
  description = "The SSH public key content."
  value       = data.aws_iam_user_ssh_key.example.public_key
}

# Output SSH Key Status
output "ssh_key_status" {
  description = "Status of the SSH public key (Active/Inactive)."
  value       = data.aws_iam_user_ssh_key.example.status
}
