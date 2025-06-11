TAG=asp_docker_ubuntu
VERSION=v1
IMAGE=upset_docker_ubuntu
UPSET_PATH=../data/INSTALL

build-docker:
	-docker image rm -f $(IMAGE):$(VERSION)
	docker build -t  $(IMAGE):$(VERSION) .

run:
	-docker container rm $(TAG) -f
	docker run -it  --security-opt label=type:container_runtime_t --network=host -e DISPLAY=$$DISPL -v ${UPSET_PATH}:/home/UPSET -v /tmp/.X11-unix:/tmp/.X11-unix --name $(TAG) $(IMAGE):$(VERSION)

sh:
	docker exec -it $(TAG) /bin/bash

save:
	docker image save $(IMAGE):$(VERSION) > $(IMAGE).$(VERSION).tar
	tar -czvf $(IMAGE).$(VERSION).tar.gz $(IMAGE).$(VERSION).tar
	rm -f $(IMAGE).$(VERSION).tar
load:
	-docker image rm -f $(IMAGE):$(VERSION)
	docker image load < $(IMAGE).$(VERSION).tar
