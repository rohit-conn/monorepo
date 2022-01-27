variable "description" {
  description = "Description of the Lambda function"
  type        = string
  default     = ""
}

variable "lambda_handler" {
  description = "The entry point of the function $FILENAME.METHOD"
  type        = string
}

variable "memory_size" {
  description = "Amount of memory to assign to Lambda"
  type        = number
  default     = 128
}

variable "name" {
  description = "The name of the lambda function to create"
  type        = string
}

variable "python_runtime" {
  description = "Python runtime version"
  type        = string
  default     = "python3.8"
}

variable "s3_bucket" {
  description = "S3 bucket to invoke Lambda function"
  type        = string
  default     = ""
}

variable "s3_bucket_arn" {
  description = "S3 bucket to invoke Lambda function"
  type        = string
  default     = ""
}

variable "source_path" {
  description = "Path of lambda function in mmonorepo"
  type        = string
  default     = ""
}

variable "timeout" {
  description = "Lambda timeout time in seconds"
  type        = number
  default     = 3
}

variable "variables" {
  description = "Environmental variables to add to the lambda"
  type        = map(string)
  default     = {}
}

variable "versioning_enabled" {
  description = "Enable publish / versioning of Lambda function"
  type        = bool
  default     = true
}
