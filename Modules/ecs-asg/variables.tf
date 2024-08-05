variable "name_prefix" {
  type        = string
  description = "Prefix used for asg and lc name"
}

variable "userdata" {
  type        = string
  description = "User data for the EC2 Instance"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}

variable "image_id" {
  type        = string
  description = "ID of the required AMI"
}

variable "security_groups" {
  type        = list(string)
  description = "List of associated security group IDs"
}

variable "key_name" {
  type        = string
  description = "Key pair name"
}

variable "iam_instance_profile" {
  type        = string
  description = "IAM instance profile name"
}

variable "vpc_zone_identifier" {
  type        = list(string)
  description = "List of subnet IDs"
}

variable "min_size" {
  type        = string
  description = "Minimum size of the auto scaling group"
}

variable "min_size_stop" {
  description = "The value for stop_min_size"
  type        = number
  default     = 0
}

variable "max_size" {
  type        = string
  description = "Maximum size of the auto scaling group"
}

variable "max_size_stop" {
  description = "The value for stop_max_size"
  type        = number
  default     = 0
}

variable "desired_capacity" {
  type        = string
  description = "Desired size of the auto scaling group"
}

variable "desired_capacity_stop" {
  description = "The value for stop_desired_capacity"
  type        = number
  default     = 0
}

variable "schedule_start_cron" {
  type        = string
  description = "Cron schedule expression to start servers"
}

variable "schedule_stop_cron" {
  type        = string
  description = "Cron schedule expression to stop servers"
}

variable "common_tags" {
  type    = map(string)
  default = {}
}

variable "environment" {
  type = string
  description = "Enviroment to be deployed"
}

variable "project" {
  type = string
}

# # variable "service" {
#   type = string
# }

variable "environment_short" {
  type = string
}
