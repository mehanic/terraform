# Variable for IAM Username
variable "username" {
  description = "The name of the IAM user associated with the SSH public key."
  type        = string
  default     = "test-user"
}

# Variable for SSH Public Key ID
variable "ssh_public_key_id" {
  description = "The unique identifier for the SSH public key."
  type        = string
  default     = "APKARUZ32GUTKIGARLXE"
}

# Variable for SSH Key Encoding Format
variable "encoding" {
  description = "Specifies the public key encoding format. Use 'SSH' or 'PEM'."
  type        = string
  default     = "SSH"
}
