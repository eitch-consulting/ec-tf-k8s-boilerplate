locals {
  # Merge user-provided labels with module-specific default labels
  module_labels = merge(
    var.labels,
    {
      "app.kubernetes.io/managed-by" = "terraform"
      "managed-by"                   = "terraform"
      "module"                       = "tf-k8s-boilerplate"
    }
  )
}
