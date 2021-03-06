module "wp-site1" {
  source = "github.com/AvesIT/terraform-wordpress.git"

  name         = "example"
  namespace    = kubernetes_namespace.example.metadata.0.name
  wp_version   = "latest"
  main_url     = "example.org"
  storage_size = "2Gi"
}

resource "kubernetes_namespace" "example" {
  metadata {
    name = "example"
  }
}


