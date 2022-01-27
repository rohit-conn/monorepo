resource "aws_ecr_repository" "repository" {
  name                 = var.container_app_name
  image_tag_mutability = "MUTABLE"
}
