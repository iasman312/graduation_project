variable "ecs_service_name" {
  type        = string
}

variable "launch_type" {
  type        = string
}

variable "desired_count" {
  type        = number
}

variable "container_name" {
  type        = string
}

variable "container_port" {
  type        = number
}

variable "task_def_family" {
  type        = string
}

variable "container_image" {
  type        = string
}

variable "memory" {
  type        = number
}

variable "cpu" {
  type        = number
}

variable "host_port" {
  type        = number
}

variable "volume_name" {
  type        = string
}

variable "container_path" {
  type        = string
}

variable "tg_name" {
  type        = string
}

variable "tg_port" {
  type        = string
}

variable "tg_protocol" {
  type        = string
}

variable "tg_type" {
  type        = string
}

variable "health_check_path" {
  type        = string
}

variable "healthy_threshold" {
  type        = number
}

variable "unhealthy_threshold" {
  type        = number
}

variable "timeout" {
  type        = number
}

variable "interval" {
  type        = number
}

variable "matcher" {
  type        = string
}

variable "cluster" {
  type        = string
}

variable "execution_role_arn" {
  type        = string
}

variable "vpc_id" {
  type        = string
}

variable "load_balancer_arn" {
  type        = string
}

variable "container_file" {
  type        = string
}

variable "db_host" {
  type        = string
  description = "DB HOST"
}

variable "db_name" {
  type        = string
  description = "DB NAME"
  default = "foo"
}

variable "db_user" {
  type        = string
  description = "DB USER"
  default = "foo"
}

variable "db_pass" {
  type        = string
  description = "DB PASS"
  default = "foopassword"
}

variable "db_port" {
  type        = string
  description = "DB PORT"
  default = "5432"
}





