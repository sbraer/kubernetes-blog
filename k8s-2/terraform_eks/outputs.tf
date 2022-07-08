output "vpc" {
  value = module.vpc
}

output "eks" {
  value = aws_eks_cluster.demo
}