[![Deploy to Docker Registry](https://github.com/MOV-AI/containers-ros-master/actions/workflows/docker-ci.yml/badge.svg?branch=main&event=push)](https://github.com/
MOV-AI/containers-ros-master/actions/workflows/docker-ci.yml)

# containers-ros-master
MOVAI ROS master image

# quickstart

    docker run -d pubregistry.aws.cloud.mov.ai/ce/ros-master-noetic:latest

# Changes to ROS

## BP-117: Reason: new node registered with same name

This bug occurs when rosmaster's `RegistrationManager.nodes` list has references to nodes that already stopped.
When registering topics/services/params for a new instance of a node already present in the list, rosmaster requests the
previous instance to terminate.
But when that happens the URI associated to the previous node instance might be already in use by a different node
and which shuts down.

This can happen because `rosnode cleanup` doesn't unsubscribe from params, but param subscriptions were
considered when checking if a node could be removed from rosmaster's `RegistrationManager.nodes`.

We didn't unsubscribe from parameters on cleanup because there's no clear API to get that information.
