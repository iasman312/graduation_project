output "lb_arn" {
  value = aws_lb.sample.arn
}

output "lb_target_group_arn" {
  value = aws_lb_target_group.sample.arn
}

output "alb_web_listener" {
  value = aws_lb_listener.sample_1
}