# Variable for the certificate name prefix
variable "cert_name_prefix" {
  description = "The prefix of the IAM Server Certificate to filter by."
  type        = string
  default     = "my-domain.org"
}

# Variable to specify whether to fetch the latest certificate
variable "latest_cert" {
  description = "Boolean to sort results by expiration date and fetch the latest certificate."
  type        = bool
  default     = true
}

# Variable for the ELB name
variable "elb_name" {
  description = "Name of the Elastic Load Balancer."
  type        = string
  default     = "my-domain-elb"
}

# Variable for the instance port
variable "instance_port" {
  description = "The port on the instance to forward requests to."
  type        = number
  default     = 8000
}

# Variable for the instance protocol
variable "instance_protocol" {
  description = "The protocol to use for routing traffic to instances."
  type        = string
  default     = "https"
}

# Variable for the load balancer port
variable "lb_port" {
  description = "The port on which the load balancer is listening."
  type        = number
  default     = 443
}

# Variable for the load balancer protocol
variable "lb_protocol" {
  description = "The protocol to use for the load balancer listener."
  type        = string
  default     = "https"
}

# Variable for the availability zones
variable "availability_zones" {
  description = "A list of availability zones for the ELB."
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

# Variable for environment tagging
variable "environment" {
  description = "Tag to specify the environment of the ELB (e.g., Production, Development)."
  type        = string
  default     = "Production"
}
