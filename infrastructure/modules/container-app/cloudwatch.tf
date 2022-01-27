resource "aws_cloudwatch_log_group" "this" {
  name              = format("/aws/ecs/%s-log-group", var.name)
  retention_in_days = 30
}
