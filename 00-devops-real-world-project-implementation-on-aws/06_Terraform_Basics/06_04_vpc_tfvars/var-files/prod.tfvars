# Environment & Region
environment_name = "prod"
aws_region       = "ap-south-1"

# CIDR for VPC
vpc_cidr = "10.3.0.0/16"

# Subnet mask (/24 subnets)
subnet_newbits = 8

# Tags
tags = {
  Terraform   = "true"
  Project     = "retail-store"
  Owner       = "Venkat Kunam"
  Course = "DevOps Real-world Implementation Project on AWS Cloud"
  Demo = "prod.tfvars demo"
}