terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
    helm = {
      source = "hashicorp/helm"
      version = "2.14.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.31.0"
    }
    github = {
      source  = "integrations/github"
      version = "6.2.2"
    }
      kubectl = {
      source  = "alekc/kubectl"
      version = "2.0.4"
    }
  }
}

provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

data "google_client_config" "default" {}

data "google_container_cluster" "cluster1" {
  name  = google_container_cluster.cluster1.name
  project = var.project
  depends_on = [google_container_cluster.cluster1]
}

provider "helm" {
  kubernetes {
    token                  = data.google_client_config.default.access_token
    host                   = "https://${data.google_container_cluster.cluster1.endpoint}"
    cluster_ca_certificate = base64decode(data.google_container_cluster.cluster1.master_auth[0].cluster_ca_certificate)
  }
}

provider "kubernetes" {
    token                  = data.google_client_config.default.access_token
    host                   = "https://${data.google_container_cluster.cluster1.endpoint}"
    cluster_ca_certificate = base64decode(data.google_container_cluster.cluster1.master_auth[0].cluster_ca_certificate)
}

provider "github" {
  token = var.GITTOKEN
}

provider "kubectl" {
  host = "https://${data.google_container_cluster.cluster1.endpoint}"
  cluster_ca_certificate = base64decode(data.google_container_cluster.cluster1.master_auth[0].cluster_ca_certificate)
  token                  = data.google_client_config.default.access_token
  load_config_file       = false
}