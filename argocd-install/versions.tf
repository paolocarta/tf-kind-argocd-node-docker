terraform {
  required_version = "1.10.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      # version = "5.84.0"
      version = "5.72.0"

    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "= 2.35.1"
    }
  }
}