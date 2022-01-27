module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "6.5.0"
  load_balancer_type = "application"
  name    = format("%s-alb", var.name)
  vpc_id  = var.vpc_id
  subnets = var.public_subnets
  security_groups = [module.security_group_alb.security_group_id]
  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      action_type        = "forward"
      target_group_index = 0
    }
  ]
  target_groups = [
  {
    name_prefix          = "h1"
    backend_protocol     = "HTTP"
    backend_port         = 80
    deregistration_delay = 10
    target_type          = "ip"
    health_check = {
      enabled             = true
      interval            = 30
      path                = "/"
      port                = "traffic-port"
      healthy_threshold   = 3
      unhealthy_threshold = 3
      timeout             = 6
      protocol            = "HTTP"
      matcher             = "200"
    }
}
]
}
