module "group_admin" {
  source = "./modules/iam_group"
  name = "admin-terraform"
}
module "group_admin_policy" {
    source = "./modules/iam_group_policy_attachment"
    group_name = module.group_admin.name
    policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

module "group_devops" {
    source = "./modules/iam_group"
    name = "devops-terraform"
}
module "group_devops_policy" {
    source = "./modules/iam_group_policy_attachment"
    group_name = module.group_devops.name
    policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
}

module "group_auditor" {
    source = "./modules/iam_group"
    name = "auditor-terraform"
}
module "group_auditor_policy" {
    source = "./modules/iam_group_policy_attachment"
    group_name = module.group_auditor.name
    policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}
