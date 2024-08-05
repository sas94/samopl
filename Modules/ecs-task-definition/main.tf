#====================================================
# creating template
#====================================================

resource "aws_ecs_task_definition" "task_definition" {
  family                = var.family
  container_definitions = jsonencode(var.container_definition)
  task_role_arn         = var.task_role_arn #using variable
  network_mode          = "awsvpc"
}

# resource "aws_iam_role" "ecs_task_role" {
#   name               = "${var.project}-${var.service}-${var.environment_short}-${var.region}-task-role"
#   assume_role_policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Sid": "",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "ecs-tasks.amazonaws.com"
#       },
#       "Action": "sts:AssumeRole"
#     }
#   ]
# }
# EOF
# }