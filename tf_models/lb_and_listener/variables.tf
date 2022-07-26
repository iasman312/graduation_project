variable "lb_name" {
  type        = string
  description = "Load balancer name"
}

variable "lb_type" {
  type        = string
  description = "Load balancer type"
}

variable "internal" {
  type        = bool
  description = "Is it internal?"
}

variable "subnets" {
  type        = list
  description = "Subnets"
}

variable "security_groups" {
  type        = list
  description = "Security groups"
}

variable "tg_name" {
  type        = string
  description = "Target group name"
}

variable "tg_port" {
  type        = string
  description = "Target group port"
}

variable "tg_protocol" {
  type        = string
  description = "Target group protocol"
}

variable "tg_type" {
  type        = string
  description = "Target group type"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "health_check_path" {
  type        = string
  description = "Health check path"
}

variable "healthy_threshold" {
  type        = number
  description = "Healthy threshold amount"
}

variable "unhealthy_threshold" {
  type        = number
  description = "Unhealthy threshold amount"
}

variable "health_check_timeout" {
  type        = number
  description = "Health check timeout"
}

variable "health_check_interval" {
  type        = number
  description = "Health check interval"
}

variable "health_check_matcher" {
  type        = string
  description = "Health check matcher"
}

variable "certificate_arn" {
  type        = string
  description = "Certificate arn"
}