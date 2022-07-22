/*resource "kubernetes_deployment" "nginx-1" { 
  metadata { 
    name = "nginx-1" 
    namespace = "default"
  } 

  spec { 
    replicas = 1 
    selector { 
      match_labels = { 
        app = "nginx-1" 
      } 
    }
    template { 
      metadata { 
        labels = { 
          app = "nginx-1" 
        } 
        annotations = { 
          custom_text = "Another test with Terraform and K8s with NGINX"
        } 
      } 
      spec {
        container { 
          image = "nginx:1.14.2" 
          name  = "nginx-1" 
        } 
      } 
    } 
  } 
  depends_on = [aws_eks_node_group.test_cloud_watch]
} 

resource "kubernetes_service" "nginx-1-ingress" {
  metadata {
    name = "nginx-1-ingress"
    namespace = "default"
  }
  spec {
    selector = {
      app = "nginx-1"
    }

    port {
      port = 80
    }

    cluster_ip = "None"
    type ="ClusterIP"
  }
  depends_on = [kubernetes_deployment.nginx-1]
}*/
