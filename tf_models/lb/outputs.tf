output "lb_arn" {
  value = aws_lb.app_alb.arn
}

output "alb_web_listener" {
  value = aws_lb_listener.http
}