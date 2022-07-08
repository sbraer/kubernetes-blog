output "CIDR" {
  value = data.aws_vpc.selected.cidr_block
}

output "cert" {
    value = data.aws_acm_certificate.cert.arn
}

output "apache-url" {
    value = "https://${aws_route53_record.www-apache.fqdn}"
}

output "nginx-url" {
    value = "https://${aws_route53_record.www-nginx.fqdn}"
}

output "VPC-ID" {
    value = data.aws_eks_cluster.k8sData.vpc_config[0].vpc_id
}
