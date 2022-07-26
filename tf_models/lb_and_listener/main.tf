resource "aws_lb" "sample" {
  name               = var.lb_name
  load_balancer_type = var.lb_type
  internal           = var.internal
  subnets            = var.subnets
  security_groups    = var.security_groups
}

resource "aws_lb_target_group" "sample" {
  name        = var.tg_name
  port        = var.tg_port
  protocol    = var.tg_protocol
  target_type = var.tg_type
  vpc_id      = var.vpc_id
  health_check {
    path                = var.health_check_path
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
    timeout             = var.health_check_timeout
    interval            = var.health_check_interval
    matcher             = var.health_check_matcher
  }
}

resource "aws_lb_listener" "sample_1" {
  load_balancer_arn = aws_lb.sample.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.sample.arn
  }
}

resource "aws_lb_listener" "sample_2" {
  load_balancer_arn = aws_lb.sample.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.certificate_arn 

  default_action {
    type = "fixed-response"

    fixed_response {
        content_type = "text/plain"
        message_body = "OK"
        status_code  = "200" 
    }
  }
}
