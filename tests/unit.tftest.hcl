# Mock Kubernetes provider for offline/credential-free unit testing
mock_provider "kubernetes" {}

variables {
  namespace = "default"
  labels = {
    env = "testing"
  }
}

run "valid_inputs_and_labels" {
  command = plan

  assert {
    condition     = local.module_labels["managed-by"] == "terraform"
    error_message = "Default managed-by label was not set"
  }

  assert {
    condition     = local.module_labels["module"] == "tf-k8s-boilerplate"
    error_message = "Default module label was not set"
  }

  assert {
    condition     = local.module_labels["env"] == "testing"
    error_message = "User-provided label was not preserved"
  }
}

run "invalid_namespace_validation" {
  command = plan

  variables {
    namespace = "INVALID_NAMESPACE"
  }

  expect_failures = [
    var.namespace
  ]
}

run "invalid_label_key_validation" {
  command = plan

  variables {
    labels = {
      "Invalid Key with spaces" = "value"
    }
  }

  expect_failures = [
    var.labels
  ]
}

run "invalid_label_value_validation" {
  command = plan

  variables {
    labels = {
      "valid_key" = "INVALID VALUE WITH SPACES!"
    }
  }

  expect_failures = [
    var.labels
  ]
}
