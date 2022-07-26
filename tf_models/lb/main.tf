resource "aws_lb" "app_alb" {
  name               = var.lb_name
  load_balancer_type = var.lb_type
  internal           = var.internal
  subnets            = var.subnets
  security_groups    = var.security_groups
}

# HTTP listener with default rule

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.app_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
        content_type = "text/plain"
        message_body = "OK"
        status_code  = "200" 
    }
  }
}
