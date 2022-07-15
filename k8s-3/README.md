# Test code for my blog:
https://blogs.aspitalia.com/az/

```
cd .\terraform_eks
terraform init
terraform plan
terraform apply -auto-approve

To remove:
terraform destroy -auto-approve
```

Get local Kubernetes authentication:
```
aws eks --region eu-south-1 update-kubeconfig --name K8sDemo-blog-service-account
```

Test pod with IAM role:
```
kubectl exec tests3 -- aws s3api list-buckets
kubectl exec testvpc -- aws ec2 describe-vpcs
```
