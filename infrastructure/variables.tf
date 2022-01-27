variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "Monorepo"
}

variable "container_app_name" {
  description = "Name of the serverless application"
  type        = string
  default     = "container-app"
}

variable "serverless_app_name" {
  description = "Name of the serverless application"
  type        = string
  default     = "serverless-app"
}
