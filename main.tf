module "group_admin" {
  source = "./modules/iam_group"
  name = "admin-terraform"
}

module "group_admin_policy" {
    source = "./modules/iam_group_policy_attachment"
    group_name = module.group_admin.name
    policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}