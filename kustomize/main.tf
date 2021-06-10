module "nginx_ingress" {
  source = "kbst.xyz/catalog/nginx/kustomization"
  version = "0.46.0-kbst.1"

  configuration_base_key = "default"
  configuration = {
    default = {
      replicas = [{
        name = "ingress-nginx-controller"
        count = 2
      }]
    }
  }
}
