variable "function_name" {
  description = "The name of the Lambda function"
  type        = string
}

variable "lambda_zip_path" {
  description = "Path to the Lambda deployment ZIP file"
  type        = string
}

variable "lambda_exec_role_arn" {
  description = "IAM role ARN for Lambda to assume"
  type        = string
}

variable "bucket_1" {
  description = "Source S3 bucket for original images"
  type        = string
}

variable "bucket_2" {
  description = "Destination S3 bucket for resized images"
  type        = string
}

variable "sns_topic_arn" {
  description = "ARN of the SNS topic for notifications"
  type        = string
}
