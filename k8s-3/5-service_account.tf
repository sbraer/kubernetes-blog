resource "kubernetes_service_account" "aws-sa-s3" {
  metadata {
    name = "aws-sa-s3"
    namespace = "default"
    annotations = {
        "eks.amazonaws.com/role-arn" = aws_iam_role.oidc_s3.arn
    }
  }
}

resource "kubernetes_service_account" "aws-sa-vpc" {
  metadata {
    name = "aws-sa-vpc"
    namespace = "default"
    annotations = {
        "eks.amazonaws.com/role-arn" = aws_iam_role.oidc_vpc.arn
    }
  }
}