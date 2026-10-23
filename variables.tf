variable "namespace" {
  description = "The Kubernetes namespace to target"
  type        = string
  default     = "default"

  validation {
    condition     = can(regex("^[a-z0-9]([-a-z0-9]*[a-z0-9])?$", var.namespace)) && length(var.namespace) <= 63
    error_message = "The namespace must be 1-63 characters, start and end with an alphanumeric character, and contain only lowercase letters, numbers, and hyphens."
  }
}

variable "labels" {
  description = "A map of key/value label pairs to assign to resources created by this module"
  type        = map(string)
  default     = {}

  validation {
    condition = alltrue([
      for k, v in var.labels : can(regex("^([a-z0-9]([-a-z0-9]*[a-z0-9])?(\\.[a-z0-9]([-a-z0-9]*[a-z0-9])?)*\\/)?[A-Za-z0-9]([-A-Za-z0-9_.]*[A-Za-z0-9])?$", k)) && length(k) <= 317 && length(v) <= 63 && (length(v) == 0 || can(regex("^[a-zA-Z0-9]([-a-zA-Z0-9_.]*[a-zA-Z0-9])?$", v)))
    ])
    error_message = "Kubernetes label keys must consist of an optional DNS subdomain prefix (max 253 characters) followed by a slash and a name (max 63 characters, starting and ending with an alphanumeric character containing dashes, underscores, dots, or alphanumerics). Label values must be 63 characters or less, empty or starting and ending with an alphanumeric character."
  }
}
