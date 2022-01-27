resource "aws_iam_role" "this" {
  name = format("%s-lambda-role", var.name)
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy" "this" {
  name   = format("%s-role-execution", var.name)
  role   = aws_iam_role.this.name
  policy = data.aws_iam_policy_document.this.json
}

data "aws_iam_policy_document" "this" {
  statement {
    sid    = "AllowCloudWatchLogging"
    effect = "Allow"
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:CreateLogStream",
    ]
    resources = [format("%s*", aws_cloudwatch_log_group.this.arn)]
  }
  statement {
    sid    = "AllowDyanmoAccess"
    effect = "Allow"
    actions   = [
      "dynamodb:Put*",
      "dynamodb:BatchWriteItem"
    ]
    resources = [format("%s", aws_dynamodb_table.this.arn )]
  }
  statement {
  sid       = "AllowS3Access"
  actions   = ["s3:*"]
  resources = ["${var.s3_bucket_arn}/*"]
}

}

data "aws_iam_policy_document" "assume_role" {
  version = "2012-10-17"

  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}
