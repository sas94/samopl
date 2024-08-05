
data "template_file" "user_data" {
  template = file("files/cluster.sh")
  vars = {
    ecs_cluster = "${var.account}-${var.project}-${var.environment_short}-cluster"
  }
}


#==================================================================
# Creating cluster
#==================================================================
module "ecs-cluster" {
  source = "../Modules/ecs-cluster"
  cluster_name = var.cluster_name
}

#==================================================================
# Creating launch configuration and ASG for EC2
#==================================================================

module "test-asg" {
  source       = "../Modules/ecs-asg"

  name_prefix           = var.name_prefix
  instance_type         = var.instance_type
  image_id              = var.image_id ##need to check
  security_groups       = var.security_groups
  key_name              = var.key_name
  iam_instance_profile  = try(var.iam_instance_profile,aws_iam_instance_profile.ecs-ec2-role.id)
  userdata              = data.template_file.user_data.rendered
  environment           = var.environment
  project               = var.project
  environment_short     = var.environment_short
  vpc_zone_identifier   = var.vpc_zone_identifier
  min_size              = var.min_size
  max_size              = var.max_size
  desired_capacity      = var.desired_capacity
  schedule_start_cron   = var.schedule_start_cron
  schedule_stop_cron    = var.schedule_stop_cron
  min_size_stop         = var.min_size_stop
  max_size_stop         = var.max_size_stop
  desired_capacity_stop = var.desired_capacity_stop 
  common_tags           = var.common_tags

}

#====================================================
# creating service
#====================================================

module "spa" {
  for_each               = local.ecs_services
  source                 = "../Modules/ecs-service"
  cluster                = module.ecs-cluster.id
  task_definition_arn    = module.spa-td[each.key].task_definition_arn
  container_name         = var.container_name
  container_port         = var.container_port
  desired_count          = var.desired_count
  name                   = var.name
  # namespace_id           = element(split("/", data.aws_route53_zone.route53.linked_service_description), 1)
  # service_discovery_name = "${var.environment_short}.qtime"
  target_group_arn       = var.target_group_arn
  subnets                = var.subnets
  security_groups        = var.security_groups
}



module "spa-td" {
  for_each             = local.ecs_services
  source               = "../Modules/ecs-task-definition"
  container_definition = each.value.container_configuration
  family               = "${var.project}-${var.environment_short}-${each.key}-td"
  task_role_arn        = try(var.task_role_arn,aws_iam_role.service-spa.arn)
  project              = var.project
  # service              = var.service
  environment_short    = var.environment_short
  region               = var.region
  # network_mode         = var.network_mode
}