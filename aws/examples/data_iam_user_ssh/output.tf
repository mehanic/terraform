output "ssh_key_fingerprint" {
  description = "MD5 message digest of the SSH public key."
  value       = module.data_iam_user_ssh.ssh_key_fingerprint
}

# Output SSH Public Key
output "ssh_public_key" {
  description = "The SSH public key content."
  value       = module.data_iam_user_ssh.ssh_public_key
}

# Output SSH Key Status
output "ssh_key_status" {
  description = "Status of the SSH public key (Active/Inactive)."
  value       = module.data_iam_user_ssh.ssh_key_status
}
