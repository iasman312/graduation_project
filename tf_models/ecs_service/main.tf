###############
# ECS service #
###############
resource "aws_ecs_service" "ecs_service" {
  name            = "jenkins"
  cluster         = data.terraform_remote_state.cluster.outputs.ecs_jenkins_cluster_id
  task_definition = aws_ecs_task_definition.jenkins-ecs-task-definition.arn
  launch_type     = "EC2"
  desired_count = 1
  ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }
  load_balancer {
    target_group_arn = data.terraform_remote_state.lb.outputs.ecs_jenkins_lb_target_group_arn
    container_name   = "jenkins"
    container_port   = 8080
  }
  lifecycle {
    ignore_changes = [desired_count]
  }
}

#######################
# ECS Task Definition #
#######################
resource "aws_ecs_task_definition" "jenkins-ecs-task-definition" {
  family                   = var.task_def_family
  requires_compatibilities = ["EC2"]
  execution_role_arn       = data.terraform_remote_state.iam_roles.outputs.ecs_task_execution_role_arn
  container_definitions    = file("container_definitions/container-def.json")
  volume {
    name = "ecs-ebs-volume"
    docker_volume_configuration {
      scope = "shared"
      autoprovision = "true"
      driver        = "local"
    }
  }
}