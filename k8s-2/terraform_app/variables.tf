variable "namespace_apache" {
  description = "K8s namespace apache"
  type        = string
  default     = "a"
}

variable "namespace_nginx" {
  description = "K8s namespace nginx"
  type        = string
  default     = "b"
}

locals {
  # tflint-ignore: terraform_unused_declarations
  validate_versioning = (var.namespace_apache == var.namespace_nginx) ? tobool("Two namespaces must contains different values.") : true
}

variable "cluster_name" {
  description = "K8s cluster name"
  type        = string
  default     = "K8sDemo"
}

variable "domain_name" {
  description = "Domain name"
  type = string
  default = "azanisite.com"
}
