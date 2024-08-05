#==================================================================
# Creating ECS cluster
#==================================================================

resource "aws_ecs_cluster" "cluster" {
  name = var.cluster_name
  tags = var.common_tags
}
