terraform {
  required_providers {
    kustomization = {
      source = "kbst/kustomization"
    }
  }
}

provider "kustomization" {
  kubeconfig_path = "~/.kube/config"
}
