variable "ecr_repo" {
  default     = ""
  type        = string
  description = "ECR repo identifier"
}

variable "name" {
  default     = "container_app"
  type        = string
  description = "Name of the fargate project"
}

variable "port" {
  default     = 5000
  type        = number
  description = "Port of the service"
}

variable "public_subnets" {
  default     = []
  type        = list(string)
  description = "Public subnets in VPC"
}

variable "private_subnets" {
  default     = []
  type        = list(string)
  description = "Private subnets in VPC"
}

variable "vpc_id" {
  default     = ""
  type        = string
  description = "VPC id to be used"
}
