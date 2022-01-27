output ecr_repo {
  value = aws_ecr_repository.repository.repository_url
}

output lb_dns {
  value = module.container_app.lb_dns_name
}
