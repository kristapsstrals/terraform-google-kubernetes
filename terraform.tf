terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.49.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 1.13.3"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.9.4"
    }
    http = {
      source  = "hashicorp/http"
      version = ">= 2.0.0"
    }
  }
}
