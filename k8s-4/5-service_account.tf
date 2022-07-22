resource "kubernetes_service_account" "aws-sa-cw" {
  metadata {
    name = "fluent-bit"
    namespace = kubernetes_namespace.amazon-cloudwatch-ns.metadata[0].name
    annotations = {
        "eks.amazonaws.com/role-arn" = aws_iam_role.oidc_cw.arn
    }
  }
}

/*resource "kubernetes_service_account" "fluent_bit" {
  metadata {
    name      = "fluent-bit"
    namespace = "amazon-cloudwatch"
  }
}*/
