provider "google" {
  project = "terraform-test-297715"
  region  = "us-central1"
  zone    = "us-central1-c"
}

module "google_cluster" {
  source = "./modules/cluster"

  providers = {
    google = google
  }

  cluster_name     = var.cluster_name
  cluster_location = var.cluster_location
}

data "google_client_config" "provider" {}

data "google_container_cluster" "google_cluster_data" {
  depends_on = [module.google_cluster]

  name     = var.cluster_name
  location = var.cluster_location
}

provider "kubernetes" {
  load_config_file = false

  host  = "https://${data.google_container_cluster.google_cluster_data.endpoint}"
  token = data.google_client_config.provider.access_token
  cluster_ca_certificate = base64decode(
    data.google_container_cluster.google_cluster_data.master_auth[0].cluster_ca_certificate,
  )
}

provider "http" {}
provider "kubectl" {
  load_config_file = false

  host  = "https://${data.google_container_cluster.google_cluster_data.endpoint}"
  token = data.google_client_config.provider.access_token
  cluster_ca_certificate = base64decode(
    data.google_container_cluster.google_cluster_data.master_auth[0].cluster_ca_certificate,
  )
}

module "kubernetes_cluster_base" {
  source = "./modules/kubernetes"

  depends_on = [module.google_cluster]

  providers = {
    kubernetes = kubernetes
    kubectl    = kubectl
    http       = http
  }
}
