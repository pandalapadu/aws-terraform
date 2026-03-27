#!/bin/bash

BUCKET_NAME="my-terraform-state-bucket-12345-venkat"
REGION="ap-south-1"
DYNAMODB_TABLE="terraform-lock"

echo "Checking if S3 bucket exists..."

if aws s3api head-bucket --bucket $BUCKET_NAME 2>/dev/null; then
  echo "S3 bucket already exists ✅"
else
  echo "Creating S3 bucket..."
  aws s3api create-bucket \
    --bucket $BUCKET_NAME \
    --region $REGION \
    --create-bucket-configuration LocationConstraint=$REGION

  echo "Enabling versioning..."
  aws s3api put-bucket-versioning \
    --bucket $BUCKET_NAME \
    --versioning-configuration Status=Enabled
fi

echo "Checking DynamoDB table..."

if aws dynamodb describe-table --table-name $DYNAMODB_TABLE --region $REGION 2>/dev/null; then
  echo "DynamoDB table already exists ✅"
else
  echo "Creating DynamoDB table..."
  aws dynamodb create-table \
    --table-name $DYNAMODB_TABLE \
    --attribute-definitions AttributeName=LockID,AttributeType=S \
    --key-schema AttributeName=LockID,KeyType=HASH \
    --billing-mode PAY_PER_REQUEST \
    --region $REGION
fi

echo "✅ Backend setup complete!"