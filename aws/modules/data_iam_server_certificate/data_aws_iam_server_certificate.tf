# Data source to fetch the IAM Server Certificate
data "aws_iam_server_certificate" "server_certificate" {
 // name_prefix = var.cert_name_prefix
  latest      = var.latest_cert
}

# Resource to create an Elastic Load Balancer (ELB)
locals {
  use_default_cert = try(data.aws_iam_server_certificate.server_certificate.arn, "arn:aws:iam::123456789012:server-certificate/default-cert")
}

resource "aws_elb" "my_domain_elb" {
  name = var.elb_name

  listener {
    instance_port      = var.instance_port
    instance_protocol  = var.instance_protocol
    lb_port            = var.lb_port
    lb_protocol        = var.lb_protocol
    ssl_certificate_id = local.use_default_cert
  }

  availability_zones = var.availability_zones

  tags = {
    Name        = var.elb_name
    Environment = var.environment
  }
}

