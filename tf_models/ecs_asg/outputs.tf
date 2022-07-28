output "asg_arn" {
  value = aws_autoscaling_group.ecs_asg.arn
}

output "lb_arn" {
  value = aws_lb.app_alb.arn
}