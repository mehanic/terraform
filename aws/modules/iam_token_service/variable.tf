# STS Global Endpoint Token Version
variable "global_endpoint_token_version" {
  description = "The version of the STS global endpoint token. Valid values: v1Token, v2Token."
  type        = string
  default     = "v2Token"
}
