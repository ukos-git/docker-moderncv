NAME      := ukos/moderncv
CONTAINER := ${NAME}:latest
LOCAL_TOP_LEVEL := $$(git rev-parse --show-toplevel)/..
DOCKER_TOP_LEVEL := /build
DIRECTORY := -v ${LOCAL_TOP_LEVEL}:${DOCKER_TOP_LEVEL}

default: build

requirements:
	 @git --version
	 @docker --version

build: requirements
	docker build -t ${CONTAINER} .

shell: build
	docker run --rm -it ${DIRECTORY} ${CONTAINER} /bin/bash

latex: build
	docker run ${DIRECTORY} ${CONTAINER}
