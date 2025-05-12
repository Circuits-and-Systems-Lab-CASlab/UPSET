TAG=asp_docker
VERSION=v1
IMAGE=asp_docker

# get the scripts directory    #
# NOTE: -v needs absolute path #
SCRIPTSDIR := $(abspath $(dir $(lastword $(MAKEFILE_LIST)))/../data)

# save image directory #
SAVEDIR := $(abspath $(dir $(lastword $(MAKEFILE_LIST)))/../use_docker)

build-docker:
	-docker image rm -f $(IMAGE):$(VERSION)
	docker build -t $(IMAGE):$(VERSION) .

run:
	-docker container rm $(TAG) -f
	docker run -it --security-opt label=type:container_runtime_t --network=host -e DISPLAY=$$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --name $(TAG) -v $(SCRIPTSDIR):/home/data $(IMAGE):$(VERSION)

sh:
	docker exec -it $(TAG) /bin/bash

save:
	docker image save $(IMAGE):$(VERSION) > $(SAVEDIR)/$(IMAGE).$(VERSION).tar