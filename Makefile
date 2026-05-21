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
	$(DOCKER_COMPOSE) run --rm upset UPSET

down:
	$(DOCKER_COMPOSE) down --remove-orphans || true

clean: down
	rm -rf workspace/reports/*

distclean: down
	rm -rf .upset workspace/reports/*
	-docker image rm upset-runtime:ubuntu20.04
