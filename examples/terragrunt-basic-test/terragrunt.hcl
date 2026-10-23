generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "kubernetes" {
  config_path = "~/.kube/config"
}
EOF
}

terraform {
  source = "../.."
}

inputs = {
  namespace = get_env("TEST_K8S_NAMESPACE", "default")
}
