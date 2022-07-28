
#####################
#  Launch template  #
#####################
resource "aws_launch_template" "ecs_lt" {
  name_prefix            = var.launch_temp_name_prefix
  key_name               = var.key_name
  image_id               = var.image_id
  vpc_security_group_ids = [data.terraform_remote_state.security_groups.outputs.security_group_ecs_id]
  user_data = base64encode(
    templatefile(
      "./config.sh",
      {
        cluster_name = var.cluster_name
      }
    )
  )
  instance_type = var.instance_type

  iam_instance_profile {
    name = data.terraform_remote_state.iam_roles.outputs.ecs_agent_instance_profile_name
  }
}

#####################
# Autoscaling_group #
#####################
resource "aws_autoscaling_group" "ecs_asg" {
  name                = var.asg_name
  vpc_zone_identifier = data.terraform_remote_state.vpc.outputs.public_subnets

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

#############################
# Application Load Balancer #
#############################
resource "aws_lb" "app_alb" {
  name               = var.lb_name
  load_balancer_type = var.lb_type
  internal           = var.internal
  subnets            = data.terraform_remote_state.vpc.outputs.public_subnets
  security_groups    = [data.terraform_remote_state.security_group.outputs.security_group_jenkins_lb_id]
}