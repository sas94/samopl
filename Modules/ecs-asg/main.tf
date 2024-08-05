#==================================================================
# Creating launch configuration for EC2
#==================================================================

resource "aws_launch_configuration" "lc" {
  name_prefix          = var.name_prefix
  instance_type        = var.instance_type
  image_id             = var.image_id
  security_groups      = var.security_groups
  key_name             = var.key_name
  iam_instance_profile = var.iam_instance_profile
  user_data            = var.userdata
  lifecycle {
    create_before_destroy = true
  }
}

#==================================================================
# Creating autoscaling group
#==================================================================

resource "aws_autoscaling_group" "asg" {
  name_prefix          = var.name_prefix
  launch_configuration = aws_launch_configuration.lc.id
  vpc_zone_identifier  = var.vpc_zone_identifier
  min_size             = var.min_size
  max_size             = var.max_size
  desired_capacity     = var.desired_capacity
  dynamic "tag" {
    for_each = var.common_tags
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
  lifecycle {
    create_before_destroy = true
  }
}

#==================================================================
# Creating autoscaling schedule for starting instances
#==================================================================

resource "aws_autoscaling_schedule" "asg_start" {
  count                  = var.environment == "production" ? 0 : 1
  scheduled_action_name  = "${var.name_prefix}start-instances"
  min_size               = var.min_size
  max_size               = var.max_size
  desired_capacity       = var.desired_capacity
  recurrence             = var.schedule_start_cron
  autoscaling_group_name = aws_autoscaling_group.asg.name
}

#==================================================================
# Creating autoscaling schedule for stopping instances
#==================================================================

resource "aws_autoscaling_schedule" "asg_stop" {
  count                  = var.environment == "production" ? 0 : 1
  scheduled_action_name  = "${var.name_prefix}stop-instances"
  min_size               = var.min_size_stop
  max_size               = var.max_size_stop
  desired_capacity       = var.desired_capacity_stop
  recurrence             = var.schedule_stop_cron
  autoscaling_group_name = aws_autoscaling_group.asg.name
}