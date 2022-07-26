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

variable "security_group_ids" {
  type        = list(any)
  description = "A launch template security group id"
}

variable "cluster_name" {
  type        = string
  description = "A cluster name"
}

variable "instance_type" {
  type        = string
  description = "An instance type"
}

variable "iam_instance_profile_name" {
  type        = string
  description = "IAM instance profile name"
}

variable "asg_name" {
  type        = string
  description = "Autoscaling group name"
}

variable "vpc_zone_identifier" {
  type        = list(any)
  description = "VPC zone identifier"
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

variable "target_group_arns" {
  type        = list(any)
  description = "Target group arns"
}

variable "protect_from_scale_in" {
  type        = bool
  description = "Protect from scale in"
}
