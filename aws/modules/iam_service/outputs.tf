output "service_linked_roles" {
  description = "Details of the created service-linked roles."
  value = {
    for key, role in aws_iam_service_linked_role.service_linked_role :
    key => {
      id          = role.id
      arn         = role.arn
      name        = role.name
      path        = role.path
      create_date = role.create_date
    }
  }
}
