terraform {
  required_version = ">= 1.0.0"
  backend "s3" {
    bucket  = "alb-project-bucket123"                      # Replace with your unique S3 bucket name
    key     = "path/to/myfile/s3-sns/statefile/terraform.tfstate" # Path inside the bucket to store the state
    region  = "us-east-1"                                  # Replace with your desired AWS region
    encrypt = true                                         # Enable encryption of the state file
    acl     = "private"                                    # Ensure the bucket is private
  }
}

# Step 2: Create the DynamoDB table for state locking
resource "aws_dynamodb_table" "terraform_lock_table" {
  name         = "terraform-lock-table"
  hash_key     = "LockID"          # Partition key for DynamoDB table
  billing_mode = "PAY_PER_REQUEST" # Use on-demand billing

  attribute {
    name = "LockID"
    type = "S" # String type for LockID
  }

  tags = {
    Name = "Terraform Lock Table"
  }
}
