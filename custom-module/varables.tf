##Cluster definition
variable "cluster_name" {
}

##ASG variable declaration
variable "account" {
  
}
variable "name_prefix" {}
variable "instance_type" {}
variable "image_id" {}
variable "security_groups" {}
variable "key_name" {}
# variable "iam_instance_profile" {}
variable "userdata" {}
variable "environment" {}
variable "project" {}
variable "environment_short" {}
variable "vpc_zone_identifier" {}
variable "min_size" {}
variable "max_size" {}
variable "desired_capacity" {}
variable "schedule_start_cron" {}
variable "schedule_stop_cron" {}
variable "min_size_stop" {}
variable "max_size_stop" {}
variable "desired_capacity_stop" {}
variable "common_tags" {}
# variable "cluster" {}
# variable "task_definition_arn" {}
variable "container_name" {}
variable "container_port" {}
variable "desired_count" {}
# variable "name" {}
variable "target_group_arn" {}
variable "subnets" {}
variable "name" {}
# variable "family" {}
# variable "task_role_arn" {}
# variable "service" {}
variable "region" {}
# variable "network_mode" {}
variable "application" {}

variable "common_environment_vars" {
  description = "Common environment variables for ECS containers"
  type = list(object({
    name  = string
    value = string
  }))
}

variable "iam_instance_profile" {
  type = string
  default = null
}
variable "task_role_arn" {
  type = string
  default = null
}
# variable "execution_role_arn" {
#   type = string
#   default = ""
# }

variable "container_default" {
  # type = map()
  
}
