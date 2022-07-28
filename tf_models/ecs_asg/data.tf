data "terraform_remote_state" "vpc" {
  backend = "s3"
  workspace = terraform.workspace
  config = {
    bucket  = "terraform-state-asman"
    profile = "MyAWS"
    region = "us-east-1"
    key = "terraform_infrastructure/vpc/terraform.tfstate"
  }
}

data "terraform_remote_state" "security_group" {
  backend = "s3"
  workspace = terraform.workspace
  config = {
    bucket  = "terraform-state-asman"
    profile = "MyAWS"
    region = "us-east-1"
    key = "terraform_infrastructure/security_groups/terraform.tfstate"
  }
}

data "terraform_remote_state" "iam_roles" {
  backend   = "s3"
  workspace = terraform.workspace
  config    = {
    bucket  = "terraform-state-asman"
    profile = "MyAWS"
    region  = "us-east-1"
    key     = "terraform_infrastructure/iam/roles/ecs/jenkins/terraform.tfstate"
  }
}

data "terraform_remote_state" "cluster" {
  backend   = "s3"
  workspace = terraform.workspace
  config    = {
    bucket  = "terraform-state-asman"
    profile = "MyAWS"
    region  = "us-east-1"
    key     = "terraform_infrastructure/ecs/clusters/jenkins/terraform.tfstate"
  }
}