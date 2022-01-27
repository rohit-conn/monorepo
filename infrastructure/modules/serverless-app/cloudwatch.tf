resource "aws_cloudwatch_log_group" "this" {
  name              = format("/aws/lambda/%s", aws_lambda_function.this.function_name)
  retention_in_days = 30
}
