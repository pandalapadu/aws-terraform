## We have already exist s3 bucket before creating .
resource "aws_s3_bucket" "tf_state" {
  bucket = "venkat-terraform-state-bucket"

  tags = {
    Name = "Terraform State"
  }
}
terraform {
  backend "s3" {
    bucket         = "venkat-terraform-state-bucket"
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock"
  }
}
resource "aws_dynamodb_table" "lock" {
  name         = "terraform-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}