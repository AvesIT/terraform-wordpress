terraform {
  required_version = ">= 0.12"

  required_providers {
    mysql      = "~> 1.9"
    kubernetes = "~> 1.10"
    random     = "~> 2.2"
  }

}
