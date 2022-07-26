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
