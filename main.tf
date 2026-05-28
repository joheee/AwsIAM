module "admin_group" {
  source = "./modules/iam_group"
  name = "admin_group"
}
module "admin_group_policy" {
    source = "./modules/iam_group_policy_attachment"
    group_name = module.admin_group.name
    policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
module "admin_user" {
    source = "./modules/iam_user"
    name = "admin_user"
}
module "admin_group_membership" {
    source = "./modules/iam_group_membership"
    name = "admin_group_membership"
    group_name = module.admin_group.name
    users = [module.admin_user.name]
}

module "devops_group" {
    source = "./modules/iam_group"
    name = "devops_group"
}
module "devops_group_policy" {
    source = "./modules/iam_group_policy_attachment"
    group_name = module.devops_group.name
    policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
}
module "devops_user" {
    source = "./modules/iam_user"
    name = "devops_user"
}
module "devops_group_membership" {
    source = "./modules/iam_group_membership"
    name = "devops_group_membership"
    group_name = module.devops_group.name
    users = [module.devops_user.name]
}

module "auditor_group" {
    source = "./modules/iam_group"
    name = "auditor_group"
}
module "auditor_group_policy" {
    source = "./modules/iam_group_policy_attachment"
    group_name = module.auditor_group.name
    policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}
module "auditor_user" {
    source = "./modules/iam_user"
    name = "auditor_user"
}
module "auditor_group_membership" {
    source = "./modules/iam_group_membership"
    name = "auditor_group_membership"
    group_name = module.auditor_group.name
    users = [module.auditor_user.name]
}