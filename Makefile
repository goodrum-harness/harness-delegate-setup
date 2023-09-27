DOCKER_COMMAND=docker
WORKSPACE=docker
DOCKERFILE=Dockerfile
REPOSITORY=harness
IMAGE=delegate
TAG=latest
IMAGE_NAME=${REPOSITORY}/${IMAGE}:${TAG}
DOCKER_ARGS:=
DOCKER_RUN=${DOCKER_COMMAND} run --rm -it -v ${PWD}:/project -w /project $(ENTRYPOINT) ${IMAGE_NAME}

# Load an existing Makefile.local with overrides or additional details.
ifneq ("$(wildcard Makefile.local)", "")
	include Makefile.local
endif

# Additional Dockerfile Build Arguments
ifneq ($(DOCKER_ARGS),)
	DOCKER_ARGS_CMD=${DOCKER_ARGS}
endif

# Additional Docker build command flags - e.g --progress plain --no-cache
ifeq ($(BUILD_FLAGS),)
	BUILD_FLAGS=
endif

.PHONY: build
build:
	${DOCKER_COMMAND} build ${BUILD_FLAGS} -f ${WORKSPACE}/${DOCKERFILE} ${DOCKER_ARGS_CMD} -t ${IMAGE_NAME} ${WORKSPACE}

.PHONY: push
push:
	${DOCKER_COMMAND} push ${IMAGE_NAME}

.PHONY: debug
debug:
	$(eval ENTRYPOINT=--entrypoint sh)
	@(${DOCKER_RUN})

.PHONY: clean
clean:
	${DOCKER_COMMAND} rmi ${IMAGE_NAME}
