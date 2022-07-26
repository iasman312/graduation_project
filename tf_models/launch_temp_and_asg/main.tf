
####### 
#  Launch template
#######
resource "aws_launch_template" "sample" {
    name_prefix = var.launch_temp_name_prefix
    key_name = var.key_name
    image_id             = var.image_id
    vpc_security_group_ids      = var.security_group_ids
    user_data            = base64encode(
                                templatefile(
                                    "./config.sh",
                                    {
                                        cluster_name = var.cluster_name
                                    }
                                )
                            )
    instance_type        = var.instance_type

    iam_instance_profile {
      name = var.iam_instance_profile_name
    }
}

####### 
#  Autoscaling_group
#######
resource "aws_autoscaling_group" "sample" {
    name                      = var.asg_name
    vpc_zone_identifier       = var.vpc_zone_identifier

    desired_capacity          = var.desired_capacity
    min_size                  = var.min_size
    max_size                  = var.max_size
    health_check_grace_period = var.health_check_grace_period
    health_check_type         = var.health_check_type
    target_group_arns     = var.target_group_arns
    protect_from_scale_in = var.protect_from_scale_in

    lifecycle {
      create_before_destroy = var.create_before_destroy
    }

    launch_template {
      id      = aws_launch_template.sample.id
      version = "$Latest"
    }
}