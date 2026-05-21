UPSET_VERSION ?= v2.0.1
DOCKER_COMPOSE := $(shell docker compose version >/dev/null 2>&1 && echo "docker compose" || echo "docker-compose")

fetch:
	UPSET_VERSION=$(UPSET_VERSION) ./docker/fetch-upset.sh

build:
	$(DOCKER_COMPOSE) build

run: fetch
	xhost +local:docker
	$(DOCKER_COMPOSE) run --rm upset /bin/bash

gui: fetch
	xhost +local:docker
	$(DOCKER_COMPOSE) run --rm upset ./UPSET

setup-shell: fetch
	xhost +local:docker
	$(DOCKER_COMPOSE) run --rm upset bash -lc 'env | grep -E "UPSET|LD_|LANG|LC_" && /bin/bash'

clean:
	$(DOCKER_COMPOSE) down --remove-orphans

distclean: clean
	rm -rf .upset
