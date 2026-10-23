# Eitch Consulting Terraform Kubernetes Module Boilerplate

A starter template for developing Kubernetes Terraform modules at Eitch Consulting.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| terraform | >= 1.5.0 |
| kubernetes | 3.4.0 |

## Providers

| Name | Version |
| ---- | ------- |
| kubernetes | 3.4.0 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [kubernetes_all_namespaces.all](https://registry.terraform.io/providers/hashicorp/kubernetes/3.4.0/docs/data-sources/all_namespaces) | data source |
| [kubernetes_namespace_v1.current](https://registry.terraform.io/providers/hashicorp/kubernetes/3.4.0/docs/data-sources/namespace_v1) | data source |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| labels | A map of key/value label pairs to assign to resources created by this module | `map(string)` | `{}` | no |
| namespace | The Kubernetes namespace to target | `string` | `"default"` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| available\_namespaces | A list of all namespace names available in the cluster |
| module\_labels | The final merged labels that will be applied to resources |
| namespace\_uid | The UID of the target namespace fetched from the data source |
<!-- END_TF_DOCS -->
