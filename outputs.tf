output "namespace_uid" {
  description = "The UID of the target namespace fetched from the data source"
  value       = data.kubernetes_namespace_v1.current.metadata[0].uid
}

output "available_namespaces" {
  description = "A list of all namespace names available in the cluster"
  value       = data.kubernetes_all_namespaces.all.namespaces
}

output "module_labels" {
  description = "The final merged labels that will be applied to resources"
  value       = local.module_labels
}
