output "namespace_uid" {
  description = "The namespace UID fetched from the module"
  value       = module.boilerplate_basic.namespace_uid
}

output "available_namespaces" {
  description = "The available namespaces fetched from the module"
  value       = module.boilerplate_basic.available_namespaces
}

output "module_labels" {
  description = "The final merged module labels"
  value       = module.boilerplate_basic.module_labels
}
