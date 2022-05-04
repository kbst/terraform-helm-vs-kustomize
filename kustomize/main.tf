module "nginx_ingress" {
  source  = "kbst.xyz/catalog/nginx/kustomization"
  version = "1.1.3-kbst.1"

  configuration_base_key = "default"
  configuration = {
    default = {
      common_labels = {
        "example-selector" = "example"
      }

      replicas = [{
        name  = "ingress-nginx-controller"
        count = 2
      }]
    }
  }
}
