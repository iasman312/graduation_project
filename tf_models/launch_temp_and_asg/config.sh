#!/bin/bash
sudo apt-get update
echo "ECS_CLUSTER=${cluster_name}" >> /etc/ecs/ecs.config