resource "aws_iam_group_policy" "this" {
    name = var.name
    group = var.group_name
    policy = jsonencode(var.policy)
}