provider "aws" {
  region = "ap-south-1"
}

# ✅ Get latest Amazon Linux AMI (FIXED APPROACH)
data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# ✅ Network Module
module "network" {
  source      = "../../01.Modules/01-Network"
  vpc_cidr    = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
}

# ✅ Compute Module
module "compute" {
  source        = "../../01.Modules/02-Compute"
  ami_id        = data.aws_ami.amazon_linux.id   # ✅ FIXED
  instance_type = var.instance_type
  subnet_id     = module.network.subnet_id
  name          = "dev-amazon-linux-ec2"
}