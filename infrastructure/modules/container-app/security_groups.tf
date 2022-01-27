module "security_group_alb" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.3.0"

  name   = format("%s-sg-alb", var.name)
  vpc_id = var.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp"]


  egress_with_source_security_group_id = [
    {
        from_port                = var.port
        to_port                  = var.port
        protocol                 = "tcp"
        description              = "ECS service security group"
        source_security_group_id = module.security_group_ecs.security_group_id
  }
 ]
}

module "security_group_ecs" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.3.0"

  name         = format("%s-sg-ecs", var.name)
  vpc_id       = var.vpc_id
  egress_rules = ["all-all"]

  ingress_with_source_security_group_id = [
    {
        from_port = var.port
        to_port   = var.port
        protocol  = "tcp"
        source_security_group_id = module.security_group_alb.security_group_id
    }
  ]
}
