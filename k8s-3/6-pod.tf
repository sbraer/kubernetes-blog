resource "kubernetes_pod" "tests3" {
  metadata {
    name = "tests3"
    namespace = "default"
  }

  spec {
    service_account_name = kubernetes_service_account.aws-sa-s3.metadata[0].name
    container {
      image = "amazon/aws-cli:2.7.12"
      name  = "aws-cli"
      command = [ "/bin/bash", "-c", "--" ]
      args = [ "sleep infinity" ]
   }
  }
}

resource "kubernetes_pod" "testvpc" {
  metadata {
    name = "testvpc"
    namespace = "default"
  }

  spec {
    service_account_name = kubernetes_service_account.aws-sa-vpc.metadata[0].name
    container {
      image = "amazon/aws-cli:2.7.12"
      name  = "aws-cli"
      command = [ "/bin/bash", "-c", "--" ]
      args = [ "sleep infinity" ]
   }
  }
}
