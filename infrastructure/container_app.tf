module container_app {
  source = "./modules/container-app"
  name = var.container_app_name
  ecr_repo = aws_ecr_repository.repository.repository_url
  vpc_id   = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
  private_subnets = module.vpc.private_subnets

}
