resource "kubernetes_ingress_v1" "api-ingress-nginx" {
  metadata {
    name = "api-ingress-nginx"
    annotations = {
      "kubernetes.io/ingress.class" = "nginx-ingress"
      "nginx.ingress.kubernetes.io/rewrite-target" =  "/"
    }
    namespace = "default"
  }
  spec {
    rule {
      host = var.domain_name
      http {
        path {
          path = "/"
          backend {
            service {
              name = kubernetes_service.apache-service.metadata.0.name
              port {
                number = 80
              }
            }
          }
        }
      }
    }
    rule {
      host = "nginx.${var.domain_name}"
      http {
        path {
          path = "/"
          backend {
            service {
              name = kubernetes_service.nginx-service.metadata.0.name
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }

  depends_on = [
    null_resource.ingress_all
  ]
}