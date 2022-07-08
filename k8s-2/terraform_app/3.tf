locals {
  html_home_page = <<EOF
<html>
<head>
  <title>Apache web server</title>
  <style>body {font-family:verdana;text-align:center}</style>
</head>
<body>
  <h1>My apache home page</h1>
  <p>Simple example with content in config map</p>
</body>
</html>
EOF
}

resource "kubernetes_config_map" "html-apache-content" {
  metadata {
    name = "html-apache-content"
    namespace = kubernetes_namespace.namespace-apache.metadata.0.name
  }
  binary_data = {
    "HomePage" = base64encode(local.html_home_page)
  }
}

resource "kubernetes_deployment" "apache-1" { 
  metadata { 
    name = "apache-1" 
    namespace = kubernetes_namespace.namespace-apache.metadata.0.name
  } 

  spec { 
    replicas = 1 
    selector { 
      match_labels = { 
        app = "apache-1" 
      } 
    }
    template { 
      metadata { 
        labels = { 
          app = "apache-1" 
        } 
        annotations = { 
          custom_text = "Another test with Terraform and K8s with Apache"
        } 
      } 
      spec {
        container { 
          image = "httpd:2.4.54-alpine3.16" 
          name  = "apache-1"
          volume_mount {
            name = "config-volume-apache"
            mount_path = "/usr/local/apache2/htdocs/"
            read_only = true
          }
        } 
      
        volume {
          name = "config-volume-apache"
          config_map {
            name = "html-apache-content"
            items {
                key = "HomePage"
                path = "index.html"
            }            
          }
        }
      }
    }
  } 
  depends_on = []
} 

resource "kubernetes_service" "apache-1-ingress" {
  metadata {
    name = "apache-1-ingress"
    namespace = kubernetes_namespace.namespace-apache.metadata.0.name
  }
  spec {
    selector = {
      app = "apache-1"
    }

    port {
      port = 80
    }

    cluster_ip = "None"
    type ="ClusterIP"
  }
  depends_on = [kubernetes_deployment.apache-1]
}

resource "kubernetes_service" "apache-service" {
  metadata {
    name = "apache-service"
  }

  spec {
    type = "ExternalName"
    external_name = "${kubernetes_service.apache-1-ingress.metadata.0.name}.${kubernetes_namespace.namespace-apache.metadata.0.name}.svc.cluster.local"
  }
}