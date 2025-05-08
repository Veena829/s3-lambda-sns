resource "aws_lambda_layer_version" "pillow_layer" {
  filename          = var.layer_zip_path
  layer_name        = "pillow-layer"
  compatible_runtimes = ["python3.9"]
}

resource "aws_lambda_function" "image_resizer" {
  function_name = var.function_name
  role          = var.lambda_exec_role_arn
  handler       = "image-resizing-s3.lambda_handler"
  runtime       = "python3.9"
  filename      = var.lambda_zip_path
  source_code_hash = filebase64sha256(var.lambda_zip_path)
  memory_size   = 256
  timeout       = 15

  # 👇 Use prebuilt Pillow layer from Klayers
  layers = ["arn:aws:lambda:ap-south-1:770693421928:layer:Klayers-p39-pillow:1"]

  environment {
    variables = {
      BUCKET_2      = var.bucket_2
      SNS_TOPIC_ARN = var.sns_topic_arn
    }
  }
}

resource "aws_lambda_permission" "allow_s3" {
  statement_id  = "AllowExecutionFromS3"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.image_resizer.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = "arn:aws:s3:::${var.bucket_1}"
}
