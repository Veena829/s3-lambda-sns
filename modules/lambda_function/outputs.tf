output "function_name" {
  value = aws_lambda_function.image_resizer.function_name
}

output "pillow_layer_arn" {
  value = aws_lambda_layer_version.pillow_layer.arn
}
