resource "kubernetes_namespace" "namespace-apache" { 
  metadata { 
    name = var.namespace_apache
  }
  
  depends_on = []
}

resource "kubernetes_namespace" "namespace-nginx" { 
  metadata { 
    name = var.namespace_nginx
  }
  
  depends_on = []
}