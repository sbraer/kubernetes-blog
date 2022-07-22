# Test code for my blog:
https://blogs.aspitalia.com/az/

Configure AWS:
```
aws configure
```

## First Step
```
cd .\terraform_eks
terraform init
terraform plan
terraform apply -auto-approve

To remove:
terraform destroy -auto-approve
```
## Second Step
```
cd .\terraform_app
terraform init
terraform plan
terraform apply -auto-approve

To remove:
terraform destroy -auto-approve
