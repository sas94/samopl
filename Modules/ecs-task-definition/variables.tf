variable "container_definition" {
  description = "A list of valid container definitions provided as a single valid JSON document"

}
variable "family" {
  description = "A unique name for your task definition."
  type        = string
}
# variable "service" {
#   type        = string
#   description = "Service name"
# }
variable "project" {
  type        = string
  description = "project name"
}
variable "environment_short" {
  type = string
}
variable "region" {
  type = string
}

variable "task_role_arn" {
   type = string
}

# variable "network_mode" {}

