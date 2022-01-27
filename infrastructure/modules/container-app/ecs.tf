resource "aws_ecs_cluster" "this" {
  name               = "${var.name}-cluster"
  capacity_providers = ["FARGATE"]

  default_capacity_provider_strategy {
    capacity_provider = "FARGATE"
    weight            = "100"
  }
}

resource "aws_ecs_task_definition" "this" {
  family = "service"
  requires_compatibilities = [
    "FARGATE",
  ]
  execution_role_arn = module.execution_role.iam_role_arn
  network_mode       = "awsvpc"
  cpu                = 256
  memory             = 512


  container_definitions = <<DEFINITION
[
  {
    "name": "${var.name}",
    "image": "${var.ecr_repo}",
    "essential": true,
    "portMappings": [
      {
        "protocol": "tcp",
        "containerPort": ${var.port},
        "hostPort": ${var.port}
      }
    ],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "${aws_cloudwatch_log_group.this.name}",
        "awslogs-region": "eu-west-1",
        "awslogs-stream-prefix": "ecs"
      }
    }
  }
]
DEFINITION
}

resource "aws_ecs_service" "this" {
  name            = var.name
  cluster         = aws_ecs_cluster.this.id
  task_definition = aws_ecs_task_definition.this.arn
  desired_count   = 1

  network_configuration {
    subnets          = var.public_subnets
    security_groups  = [module.security_group_ecs.security_group_id]
    assign_public_ip = true
  }

  load_balancer {
   target_group_arn = module.alb.target_group_arns[0]
   container_name   = var.name
   container_port   = var.port
 }

  deployment_controller {
    type = "ECS"
  }
  capacity_provider_strategy {
    base              = 0
    capacity_provider = "FARGATE"
    weight            = 100
  }
}
