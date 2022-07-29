#####################
#  Launch template  #
#####################
resource "aws_launch_template" "ecs_lt" {
  name_prefix            = var.launch_temp_name_prefix
  key_name               = var.key_name
  image_id               = var.image_id
  vpc_security_group_ids = var.vpc_security_group_ids
  user_data = base64encode(
    templatefile(
      "${path.module}/config.sh",
      {
        cluster_name = var.cluster_name
      }
    )
  )
  instance_type = var.instance_type

  iam_instance_profile {
    name = var.iam_instance_profile
  }
}

#####################
# Autoscaling_group #
#####################
resource "aws_autoscaling_group" "ecs_asg" {
  name                = var.asg_name
  vpc_zone_identifier = var.subnets

  desired_capacity          = var.desired_capacity
  min_size                  = var.min_size
  max_size                  = var.max_size
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = var.health_check_type
  protect_from_scale_in     = var.protect_from_scale_in

  lifecycle {
    create_before_destroy = true
  }

  launch_template {
    id      = aws_launch_template.ecs_lt.id
    version = "$Latest"
  }
}