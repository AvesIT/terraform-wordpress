variable "customer_name" {
  type = string
  description = "Customer name"
  default = "example"
}

variable "customer_namespace" {
  type = string
  description = "Customer namespace"
  default = "example_namespace"
}

variable "wp_version" {
  type = string
  description = "Version of WordPress to run (image tag)"
  default = "latest"
}

variable "main_url" {
  type = string
  description = "Main hostname/url for deployment"
  default = "example.com"
}

variable "storage_size" {
  type = string
  description = "Size of storage needed for the website"
  default = "2Gi"
}

variable "storage_class" {
  type = string
  description = "Kubernetes Storage class used for permanent storage"
  default = "nfs"
}
