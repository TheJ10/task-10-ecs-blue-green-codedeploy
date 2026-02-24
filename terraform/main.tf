module "ecs_jaspal_task10" {
  source = "./modules/ecs"
  image_tag           = var.image_tag
  ecr_repository_url = module.ecr_jaspal_task10.repository_url
  execution_role_arn = var.execution_role_arn
  aws_region     = var.aws_region

  db_host     = module.rds_jaspal_task10.db_endpoint
  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password

  target_group_arn = module.alb_jaspal_task10.blue_tg_arn
  alb_sg_id        = module.alb_jaspal_task10.alb_sg_id

}

module "rds_jaspal_task10" {
  source     = "./modules/rds"
  subnet_ids = var.subnet_ids

  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password
}

module "ecr_jaspal_task10" {
  source = "./modules/ecr"
}

module "alb_jaspal_task10" {
  source     = "./modules/alb"
  vpc_id     = module.ecs_jaspal_task10.vpc_id
  subnet_ids = var.subnet_ids
}

module "codedeploy_jaspal_task10" {
  source = "./modules/codedeploy"

  ecs_cluster_name = module.ecs_jaspal_task10.cluster_name
  ecs_service_name = module.ecs_jaspal_task10.service_name

  blue_tg_arn  = module.alb_jaspal_task10.blue_tg_arn
  green_tg_arn = module.alb_jaspal_task10.green_tg_arn
  listener_arn = module.alb_jaspal_task10.listener_arn
}