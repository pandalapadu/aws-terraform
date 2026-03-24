provider "aws" {
  region = "ap-south-1"
}

module "network" {
  source      = "../../01.Modules/01-Network"
  vpc_cidr    = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
  name        = "dev-vpc"
}

module "compute" {
  source         = "../../01.Modules/02-Compute"
  ami_id         = var.ami_id
  instance_type  = var.instance_type
  subnet_id      = module.network.subnet_id
  name           = "dev-ec2"
}