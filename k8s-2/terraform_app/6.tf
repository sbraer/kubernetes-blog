data "aws_lb" "ingress-load-balancer" {
  tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
  depends_on = [
    null_resource.ingress_all
  ]
}
