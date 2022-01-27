module "execution_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "4.6.0"
  create_role           = true
  role_requires_mfa     = false
  role_name             = format("%s-ecs", var.name)
  trusted_role_services = ["ecs-tasks.amazonaws.com"]
}
resource "aws_iam_role_policy" "execution" {
  name   = module.execution_role.iam_role_name
  role   = module.execution_role.iam_role_name
  policy = data.aws_iam_policy_document.execution.json
}

data "aws_iam_policy_document" "execution" {
  statement {
    sid       = "AccessECRAccess"
    effect    = "Allow"
    actions   = ["ecr:*"]
    resources = ["*"]
  }
  }
