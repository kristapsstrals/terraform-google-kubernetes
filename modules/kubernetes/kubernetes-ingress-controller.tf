variable "nginx_version" {
  type = string
  default = "0.41.2"
}

data "http" "nginx_ingress_controller" {
  url = "https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v${var.nginx_version}/deploy/static/provider/cloud/deploy.yaml"
}

resource "kubectl_manifest" "nginx_ingress_controller" {
  yaml_body = data.http.nginx_ingress_controller.body
}
