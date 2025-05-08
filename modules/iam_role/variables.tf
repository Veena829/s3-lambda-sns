variable "role_name" {
  description = "The name of the IAM role for Lambda"
  type        = string
}

variable "bucket_name" {
  description = "S3 bucket name the Lambda will access"
  type        = string
}

variable "sns_topic_arn" {
  description = "SNS topic ARN for publishing notifications"
  type        = string
}
