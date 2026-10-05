module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
}

module "security_groups" {
  source = "./modules/security-groups"

  vpc_id = module.vpc.vpc_id
}

module "alb" {
  source = "./modules/alb"

  vpc_id          = module.vpc.vpc_id
  public_subnet_1 = module.vpc.public_subnet_1
  public_subnet_2 = module.vpc.public_subnet_2

  alb_sg_id = module.security_groups.alb_sg_id
}

module "ecs" {
  source = "./modules/ecs"

  private_subnet_1 = module.vpc.private_subnet_1
  private_subnet_2 = module.vpc.private_subnet_2

  ecs_sg_id = module.security_groups.ecs_sg_id

  target_group_arn = module.alb.target_group_arn
}

module "rds" {
  source = "./modules/rds"

  private_subnet_1 = module.vpc.private_subnet_1
  private_subnet_2 = module.vpc.private_subnet_2

  rds_sg_id = module.security_groups.rds_sg_id
  db_password = var.db_password
}
