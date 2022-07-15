variable "aws_region" {
  description = "Aws region"
  type        = string
  default     = "eu-south-1"
}

variable "vpc_name" {
  description = "VPC name"
  type        = string
  default     = "AZ-vpc-blog-service-account"
}

variable "cluster_name" {
  description = "K8s cluster name"
  type        = string
  default     = "K8sDemo-blog-service-account"
}

variable "cluster_version" {
  description = "Cluster version"
  type        = string
  default     = "1.22"
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  type = string
  default = "t3a.small"
}

variable "ec2_instance_number" {
  description = "EC2 number of istance"
  type = number
  default = 1
}
