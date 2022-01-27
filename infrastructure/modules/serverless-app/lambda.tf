data "archive_file" "lambda_function_archive" {
  type         = "zip"
  source_file  = var.source_path
  output_path  = "./build/${var.name}.zip"
}

resource "aws_lambda_function" "this" {
  function_name    = var.name
  description      = var.description
  handler          = var.lambda_handler
  publish          = var.versioning_enabled
  runtime          = var.python_runtime
  timeout          = var.timeout
  memory_size      = var.memory_size
  role             = aws_iam_role.this.arn
  filename         = data.archive_file.lambda_function_archive.output_path
  source_code_hash = data.archive_file.lambda_function_archive.output_base64sha256

  environment {
    variables = {
      S3bucket = var.s3_bucket,
      DynamoDBTable = var.name
    }
  }
}

resource "aws_s3_bucket_notification" "aws-lambda-trigger" {
  bucket = var.s3_bucket
  lambda_function {
    lambda_function_arn = aws_lambda_function.this.arn
    events              = ["s3:ObjectCreated:*"]

  }
}
resource "aws_lambda_permission" "this" {
  statement_id  = "AllowS3Invoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.this.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = "arn:aws:s3:::${var.s3_bucket}"
}
