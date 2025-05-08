variable "bucket_1" {
  description = "Source S3 bucket for original images"
  type        = string
}

variable "bucket_2" {
  description = "Destination S3 bucket for resized images"
  type        = string
}

variable "sns_topic_arn" {
  description = "SNS topic ARN for notifications"
  type        = string
}

variable "function_name" {
  description = "Lambda function name"
  type        = string
}

variable "lambda_zip_path" {
  description = "Path to the Lambda deployment package ZIP"
  type        = string
}

variable "lambda_exec_role_arn" {
  description = "ARN of the IAM role assumed by Lambda"
  type        = string
}
