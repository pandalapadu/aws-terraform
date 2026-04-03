# Environment & Region
environment_name = "dev2-from-AUTO.TFVARS"
aws_region       = "ap-south-1"

# CIDR for VPC
vpc_cidr = "10.2.0.0/16"

# Subnet mask (/24 subnets)
subnet_newbits = 8

# Tags
tags = {
  Terraform   = "true"
  Project     = "retail-store"
  Owner       = "Kunam Venkat Rami Reddy "
  Course = "DevOps Real-world Implementation Project on AWS Cloud"
  Demo = "dev.auto.tfvars demo"
}