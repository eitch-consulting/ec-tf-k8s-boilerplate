# Sample data gathering for boilerplate variables
data "kubernetes_namespace_v1" "current" {
  metadata {
    name = var.namespace
  }
}

data "kubernetes_all_namespaces" "all" {}
