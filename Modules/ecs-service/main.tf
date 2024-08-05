#====================================================
# creating service
#====================================================

# resource "aws_service_discovery_service" "service" {
#   name = var.service_discovery_name
#   dns_config {
#     namespace_id   = var.namespace_id
#     routing_policy = "MULTIVALUE"
#     dns_records {
#       ttl  = 10
#       type = "SRV"
#     }
#   }
#   health_check_custom_config {
#     failure_threshold = 10
#   }
#   lifecycle {
#     ignore_changes = [
#       health_check_custom_config
#     ]
#   }
# }

resource "aws_ecs_service" "service" {
  name            = var.name
  cluster         = var.cluster
  desired_count   = var.desired_count
  task_definition = var.task_definition_arn
  health_check_grace_period_seconds = 300 #added here
  # service_registries {
  #   registry_arn   = aws_service_discovery_service.service.arn
  #   container_name = var.container_name
  #   container_port = var.container_port
  # }
  tags = var.common_tags
  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = "spa"
    container_port   = 3000
  }
  network_configuration {                         #FARGATE requires this.   *For EC2 case, those are attached on EC2 instances.
    subnets         = var.subnets
    security_groups = var.security_groups
  }

  lifecycle {
    ignore_changes = [desired_count]
  }

  propagate_tags = "SERVICE"
}