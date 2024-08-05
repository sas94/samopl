# output "service_discovery_id" {
#   value = aws_service_discovery_service.service.id
# }
# output "service_discovery_arn" {
#   value = aws_service_discovery_service.service.arn
# }
output "service_id" {
  value = aws_ecs_service.service.id
}
output "service_name" {
  value = aws_ecs_service.service.name
}
output "service_cluster" {
  value = aws_ecs_service.service.cluster
}