output "service_linked_roles" {
  description = "Details of the created service-linked roles."
  value       = module.iam_service.service_linked_roles
}
