terraform {
  required_version = "1.10.0"
}

provider "aws" {
  //region  = "us-east-1"
    region = "eu-central-1"  # Set to the expected region

  profile = "default"
}
