resource "kubernetes_namespace" "nginx_ingress" {
  metadata {
    name = "ingress-nginx"
  }
}

module "nginx_ingress" {
  source  = "terraform-module/release/helm"
  version = "2.7.0"

  namespace  = kubernetes_namespace.nginx_ingress.metadata.0.name
  repository = "https://kubernetes.github.io/ingress-nginx"

  app = {
    name          = "ingress-nginx"
    version       = "4.1.0"
    chart         = "ingress-nginx"
    force_update  = true
    wait          = false
    recreate_pods = false
    deploy        = 1
  }

  set = [
    {
      name  = "replicaCount"
      value = 2
    }
  ]
}
