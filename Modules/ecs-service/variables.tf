# variable "service_discovery_name" {
#   description = "Name of the service discovery"
#   type        = string
# }
# variable "namespace_id" {
#   description = "ID of the namespace that the service belongs to."
#   type        = string
# }
variable "name" {
  description = "Name of the service"
  type        = string
}
variable "cluster" {
  description = "Cluster name"
  type        = string
}
variable "task_definition_arn" {
  description = "Family and revision (family:revision) or full ARN of the task definition that you want to run in your service. "
  type        = string
}
variable "container_name" {
  description = "container name"
  type        = string
}
variable "container_port" {
  description = "container port"
  type        = number
}
variable "desired_count" {
  description = "Number of instances of the task definition."
  type        = number
}
variable "common_tags" {
  type        = map(string)
  default     = {}
  description = "Common resource tags"
}


variable "target_group_arn" {
  
}

variable "subnets" {
  
}

variable "security_groups" {
  
}