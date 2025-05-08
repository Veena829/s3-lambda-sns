provider "aws" {
  region = "ap-south-1"
}

module "s3_bucket_1" {
  source     = "./modules/s3_bucket"
  bucket_name = "image-non-sized-bucket-1"
}

module "s3_bucket_2" {
  source     = "./modules/s3_bucket"
  bucket_name = "image-sized-bucket-1"
}

module "sns_topic" {
  source    = "./modules/sns_topic"
  topic_name = "image-resizing-topic"
}

module "iam_role" {
  source           = "./modules/iam_role"
  role_name        = "lambda-execution-role"
  bucket_name      = module.s3_bucket_1.bucket_name
  sns_topic_arn    = module.sns_topic.topic_arn
}

module "lambda_function" {
  source               = "./modules/lambda_function"
  function_name        = "image-resizing-fn"
  lambda_zip_path      = "image-resizing-s3.zip"
  layer_zip_path       = "pillow-layer.zip" # 👈 Right here
  lambda_exec_role_arn = module.iam_role.role_arn
  bucket_1             = module.s3_bucket_1.bucket_name
  bucket_2             = module.s3_bucket_2.bucket_name
  sns_topic_arn        = module.sns_topic.topic_arn
}
