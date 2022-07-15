output "kubectl" {
  value = "aws eks --region eu-south-1 update-kubeconfig --name K8sDemo-blog-service-account"
}

output "test_pod_s3" {
  value = "kubectl exec tests3 -- aws s3api list-buckets"
}

output "test_pod_vpc" {
  value = "kubectl exec testvpc -- aws ec2 describe-vpcs"
}
