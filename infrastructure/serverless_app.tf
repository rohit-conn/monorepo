resource "aws_s3_bucket" "serverless_app" {
  bucket_prefix = "${var.serverless_app_name}-"
  acl    = "private"
  force_destroy = true

  versioning {
    enabled = false
  }
}

resource "aws_s3_bucket_notification" "s3-trigger" {
    bucket = aws_s3_bucket.serverless_app.id

    lambda_function {
        lambda_function_arn = "${module.serverless_app.lambda_arn}"
        events              = ["s3:ObjectCreated:*"]
        filter_suffix       = ".csv"
    }
    # Be sure to have the correct execution rights before creating the trigger
    depends_on = [module.serverless_app]
}


module serverless_app {
  source = "./modules/serverless-app"
  name = var.serverless_app_name
  source_path = "../serverless-app/CSV_to_Dynamo.py"
  s3_bucket = aws_s3_bucket.serverless_app.bucket
  s3_bucket_arn = aws_s3_bucket.serverless_app.arn
  lambda_handler = "CSV_to_Dynamo.lambda_handler"
}
