ARG DOCKER_REGISTRY="pubregistry.aws.cloud.mov.ai"
FROM ${DOCKER_REGISTRY}/ce/movai-base-noetic:v2.4.4

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

RUN curl -fsSL https://artifacts.aws.cloud.mov.ai/repository/movai-applications/gpg | apt-key add - && \
    curl -fsSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros.key

USER movai
