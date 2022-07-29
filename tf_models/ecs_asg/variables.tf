variable "region" {
  type        = string
  description = "A region of our network"
  default     = "us-east-1"
}

variable "profile_name" {
  type        = string
  description = "A aws profile name"
  default     = "MyAWS"
}

variable "launch_temp_name_prefix" {
  type        = string
  description = "A launch template name prefix"
}

variable "key_name" {
  type        = string
  description = "A launch template key name"
}

variable "image_id" {
  type        = string
  description = "A launch template image id"
}

variable "cluster_name" {
  type        = string
  description = "A cluster name"
}

variable "instance_type" {
  type        = string
  description = "An instance type"
}

variable "asg_name" {
  type        = string
  description = "Autoscaling group name"
}

variable "desired_capacity" {
  type        = number
  description = "Desired capacity"
}

variable "min_size" {
  type        = number
  description = "Min size"
}

variable "max_size" {
  type        = number
  description = "Max size"
}

variable "health_check_grace_period" {
  type        = number
  description = "Health check grace period"
}

variable "health_check_type" {
  type        = string
  description = "Health check type"
}

variable "protect_from_scale_in" {
  type        = bool
  description = "Protect from scale in"
}

variable "vpc_security_group_ids" {
  type = list
}

variable "iam_instance_profile" {
  type = string
}

variable "subnets" {
  type = list
}
