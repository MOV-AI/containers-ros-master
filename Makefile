REGISTRY="registry.cloud.mov.ai"
ENV="devops"
IMAGE_NAME="ros-master-noetic"
IMAGE_TAG="local"

image:
	docker build -f noetic/Dockerfile -t $(REGISTRY)/$(ENV)/$(IMAGE_NAME):$(IMAGE_TAG) .

clean:
	docker image rm -f $(REGISTRY)/$(ENV)/$(IMAGE_NAME):$(IMAGE_TAG) || true
