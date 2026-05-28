module "group_admin" {
  source = "./modules/iam_group"
  name = "admin-terraform"
}

module "group_admin_policy" {
    source = "./modules/iam_group_policy"
    name = "admin-terraform-policy"
    group_name = module.group_admin.name
    policy = {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Action": "*",
                "Resource": "*"
            }
        ]
    }
}