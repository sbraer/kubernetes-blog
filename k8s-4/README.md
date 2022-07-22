# Test code for my blog:
https://blogs.aspitalia.com/az/

Configure AWS:
```
aws configure
```

Create EKS and install Fluent Bit:
```
aws configure
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

Install pod to test Fluent Bit:
```
kubectl apply -f nginx.yaml
```

To test nginx with local browser:
```
kubectl get po
kubectl port-forward pod/{name pod from previous command} 8080:80
curl localhost:8080
```
