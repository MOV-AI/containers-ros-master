ARG DOCKER_REGISTRY="registry.cloud.mov.ai"
FROM ${DOCKER_REGISTRY}/devops/movai-base:noetic

# Labels
LABEL description="MOV.AI Ros Master Base Image"
LABEL maintainer="devops@mov.ai"
LABEL movai="ros-master"

# Environment config
ENV APP_NAME="ros-master" \
    ROS_MASTER_URI="http://localhost:11311/"

# startup
COPY files/movai-entrypoint.sh /usr/local/bin/movai-entrypoint.sh
COPY files/health-check.sh /usr/local/bin/health-check.sh

USER movai
