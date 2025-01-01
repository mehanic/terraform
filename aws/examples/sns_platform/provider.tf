terraform {
  required_version = "1.10.0"
}

# Default provider configuration for resources in us-east-1
provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

# Aliased provider configuration for resources in ap-southeast-2
provider "aws" {
  alias   = "ap_southeast_2"
  region  = "ap-southeast-2"
  profile = "default"
}