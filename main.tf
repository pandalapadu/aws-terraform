# Define the AWS provider
provider "aws" {
  region = "us-east-1"   # Change to your preferred region
}

# Create an S3 bucket
resource "aws_s3_bucket" "example" {
  bucket = "venkat-reddy-terraform-demo-bucket"  # Must be globally unique
  acl    = "private"
}
