resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}

resource "helm_release" "argocd" {
    depends_on = [ google_container_node_pool.first-pool]
    name = "argocd"
    repository = "https://argoproj.github.io/argo-helm"
    chart = "argo-cd"
    version = "7.2.1"
    namespace = kubernetes_namespace.argocd.id

    set {
      name = "server.service.type"
      value = "LoadBalancer"
    }

    set {
      name = "server.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-type"
      value = "nlb"
    }
}

resource "github_repository_deploy_key" "argocd_repo_deploykey" {
  title = "argocd-connect"
  repository = "CloudComputing"
  key = var.SSHPUBKEY
  read_only = "false"
}

resource "kubernetes_secret_v1" "ssh_key" {
  metadata {
    name = "repository-private-ssh-key"
    namespace = kubernetes_namespace.argocd.id
    labels = {
      "argocd.argoproj.io/secret-type" = "repository"
    }
  }
  type = "Opaque"

  data = {
    "sshPrivateKey" = var.SSHPRIVATEKEY
    "type" = "git"
    "url" = "git@github.com:kselight/CloudComputing.git"
    "name" = "github"
    "project" = "*"
  }
}