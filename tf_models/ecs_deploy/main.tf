###############
# ECS service #
###############
resource "aws_ecs_service" "ecs_service" {
  name            = var.ecs_service_name
  cluster         = data.terraform_remote_state.cluster.outputs.ecs_jenkins_cluster_id
  task_definition = aws_ecs_task_definition.ecs_td.arn
  launch_type     = var.launch_type
  desired_count = var.desired_count
  ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }
  load_balancer {
    target_group_arn = aws_lb_target_group.lb_tg.arn
    container_name   = var.container_name
    container_port   = var.container_port
  }
  lifecycle {
    ignore_changes = [desired_count]
  }
}

#######################
# ECS Task Definition #
#######################
resource "aws_ecs_task_definition" "ecs_td" {
  family                   = var.task_def_family
  requires_compatibilities = ["EC2"]
  execution_role_arn       = data.terraform_remote_state.iam_roles.outputs.ecs_task_execution_role_arn
  container_definitions    = templatefile(
    "${path.module}/container_info.json", 
    {
      container_name = var.container_name, 
      container_image = var.container_image, 
      memory = var.memory, 
      cpu = var.cpu, 
      container_port = var.container_port, 
      host_port = var.host_port, 
      source_volume = var.volume_name,
      container_path = var.container_path
    }
  )
  volume {
    name = var.volume_name
    docker_volume_configuration {
      scope = "shared"
      autoprovision = "true"
      driver        = "local"
    }
  }
}

####################
# ALB Target Group #
####################
resource "aws_lb_target_group" "lb_tg" {
  name        = var.tg_name
  port        = var.tg_port
  protocol    = var.tg_protocol
  target_type = var.tg_type
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id
  health_check {
    path                = var.health_check_path
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
    timeout             = var.timeout
    interval            = var.interval
    matcher             = var.matcher
  }
}

#####################
# ALB Listener Rule #
#####################
resource "aws_lb_listener" "http_listener_forward" {
  load_balancer_arn = data.terraform_remote_state.cluster.outputs.lb_arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.target_group.arn}"
  }
}