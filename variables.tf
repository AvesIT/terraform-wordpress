variable "name" {
  type        = string
  description = "Deployment name"
  default     = "example"
}

variable "namespace" {
  type        = string
  description = "Deployment namespace"
  default     = "example_namespace"
}

variable "chart_version" {
  type        = string
  description = "Chart version"
  default     = ""
}

variable "wp_version" {
  type        = string
  description = "Version of WordPress to run (image tag)"
  default     = "latest"
}

variable "image_repository" {
  type        = string
  description = "Repository to get image from"
  default     = "bitnami/wordpress"
}

variable "image_registry" {
  type        = string
  description = "Container registry to get image from"
  default     = "docker.io"
}

variable "main_url" {
  type        = string
  description = "Main hostname/url for deployment"
  default     = "example.com"
}

variable "storage_size" {
  type        = string
  description = "Size of storage needed for the website"
  default     = "2Gi"
}

variable "storage_class" {
  type        = string
  description = "Kubernetes Storage class used for permanent storage"
  default     = "nfs"
}

variable "storage_mode" {
  type        = string
  description = "Mount mode for storage"
  default     = "ReadWriteMany"
}

variable "db_uri" {
  type        = string
  description = "Hostname:port to connect to underlying database"
  default     = "mariadb"
}

variable "db_connect_range" {
  type        = string
  description = "IP address (in MySQL format) that connections are tolerated from. For instance, a node ip range, service range or pod range"
  default     = "10.42.%"
}

variable "cluster_issuer" {
  type        = string
  description = "Certmanager cluster-issuer for this ingress"
  default     = "letsencrypt-staging"
}

variable "extraURL" {
  type        = list(string)
  description = "Extra hosts to be added to the ingress"
  default     = []
}

variable "replicas" {
  type        = number
  description = "Number of replica pods desired"
  default     = 1
}

variable "debug" {
  type        = bool
  description = "Enable debug for the container"
  default     = false
}

