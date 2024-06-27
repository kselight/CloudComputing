variable "project" {}

variable "region" {
  default = "europe-west10"
}

variable "zone" {
  default = "europe-west10-a"
}

variable "namespace" {
  default = "argocd"
}

variable "cluster_name" {
  default = "cluster1"
}

variable "GITTOKEN" {
  type = string
  description = "Token to access the GitHub account"
}

variable "SSHPUBKEY" {
  type = string
  description = "GitHub public deploy token"
  
}

variable "SSHPRIVATEKEY" {
  type = string 
  description = "GitHub private deploy token"
}