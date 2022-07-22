provider "kubernetes" {
  host                   = aws_eks_cluster.demo.endpoint
  token                  = data.aws_eks_cluster_auth.demo.token
  cluster_ca_certificate = base64decode(aws_eks_cluster.demo.certificate_authority.0.data)
}


data "tls_certificate" "eks" {
  url = aws_eks_cluster.demo.identity[0].oidc[0].issuer
}

resource "aws_iam_openid_connect_provider" "eks" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.eks.certificates[0].sha1_fingerprint]
  url             = aws_eks_cluster.demo.identity[0].oidc[0].issuer
}

resource "kubernetes_namespace" "amazon-cloudwatch-ns" {
  metadata {
    annotations = {
      name = "amazon-cloudwatch"
      description = "Namespace for Fluent Bit"
      author = "AZ"
      license = "public"
    }

    name = "amazon-cloudwatch"
  }
}