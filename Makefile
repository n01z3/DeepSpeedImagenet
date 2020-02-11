APP_NAME=n01z3/deepspeed-imagenet
CONTAINER_NAME=n01z3-deepspeed-imagenet

# HELP
.PHONY: help

help: ## This help.
	@awk 'BEGIN (FS = ":.*?## ") /^[a-zA-Z_-]+:.*?## / (printf "\033[36m%-30s\033[0m %s\n", $$1, $$2)' $(MAKEFILE_LIST)

build:  ## Build the container
	nvidia-docker build -t $(APP_NAME) .

run-dl2: ## Run container in omen
	nvidia-docker run \
		-itd \
		--ipc=host \
		--name=$(CONTAINER_NAME) \
		-e DISPLAY=localhost:10.0 \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v /mnt/ssd1/dataset/imagenet1k:/data \
		-v $(shell pwd):/DeepSpeedImagenet $(APP_NAME) bash

run-dl4: ## Run container in omen
	nvidia-docker run \
		-itd \
		--ipc=host \
		--name=$(CONTAINER_NAME) \
		-e DISPLAY=localhost:10.0 \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v /mnt/ssd2/dataset/imagenet1k:/data \
		-v $(shell pwd):/DeepSpeedImagenet $(APP_NAME) bash


run-dl0: ## Run container in omen
	nvidia-docker run \
		-itd \
		--ipc=host \
		--name=$(CONTAINER_NAME) \
		-e DISPLAY=localhost:10.0 \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v /mnt/ssd1/dataset/imagenet1k:/data \
		-v $(shell pwd):/DeepSpeedImagenet $(APP_NAME) bash



exec: ## Run a bash in a running container
	nvidia-docker exec -it $(CONTAINER_NAME) bash

stop: ## Stop and remove a running container
	docker stop $(CONTAINER_NAME); docker rm $(CONTAINER_NAME)