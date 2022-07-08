data "aws_route53_zone" "myzone" {
  name = var.domain_name
}

data "aws_acm_certificate" "cert" {
  domain   = var.domain_name
}

data "aws_eks_cluster" "k8sData" {
  name = var.cluster_name
}

data "aws_vpc" "selected" {
  id = data.aws_eks_cluster.k8sData.vpc_config[0].vpc_id
}
