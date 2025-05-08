resource "aws_sns_topic" "image_resize_topic" {
  name = var.topic_name
}

output "topic_arn" {
  value = aws_sns_topic.image_resize_topic.arn
}
