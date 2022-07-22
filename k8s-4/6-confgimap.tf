resource "kubernetes_config_map" "fluent-bit-cluster-info" {
  metadata {
    name = "fluent-bit-cluster-info"
    namespace = kubernetes_namespace.amazon-cloudwatch-ns.metadata[0].name
  }

  data = {
    "cluster.name" = var.cluster_name
    "http.server"  = "On"
    "http.port"    = 2020
    "read.head"    = "Off"
    "read.tail"    = "On"
    "logs.region"  = var.aws_region
  }
}