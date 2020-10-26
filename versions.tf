terraform {
  required_version = ">= 0.13"

  required_providers {
    mysql = {
      source = "terraform-providers/mysql"
      version = "~> 1.9.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 1.13.0"
    }
    random = {
      source = "hashicorp/random"
      version = "~> 2.2.0"
    }
    helm = {
      source = "hashicorp/helm"
      version = "~> 1.3.0"
    }
  }
}
