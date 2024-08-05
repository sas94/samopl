variable "cluster_name" {
  type        = string
  description = "Cluster name"
}

variable "common_tags" {
  type        = map(string)
  default     = {}
  description = "Common resource tags"
}