DOCKER_COMMAND=docker
WORKSPACE=docker
DOCKERFILE=Dockerfile
REPOSITORY=harness
IMAGE=delegate
TAG=latest
IMAGE_NAME=${REPOSITORY}/${IMAGE}:${TAG}
DOCKER_ARGS:=
DOCKER_RUN=${DOCKER_COMMAND} run --rm -it -v ${PWD}:/project -v /Users:/Users -w /project $(ENTRYPOINT) ${IMAGE_NAME}

ifneq ("$(wildcard Makefile.local)", "")
	include Makefile.local
endif

ifneq ($(DOCKER_ARGS),)
	DOCKER_ARGS_CMD=${DOCKER_ARGS}
endif

ifeq ($(DEBUG_BUILD),)
	DEBUG_BUILD=
endif

.PHONY: build
build:
	${DOCKER_COMMAND} build ${DEBUG_BUILD} -f ${WORKSPACE}/${DOCKERFILE} ${DOCKER_ARGS_CMD} -t ${IMAGE_NAME} ${WORKSPACE}

.PHONY: debug
debug:
	$(eval ENTRYPOINT=--entrypoint sh)
	@(${DOCKER_RUN})

.PHONY: clean
clean:
	${DOCKER_COMMAND} rmi ${IMAGE_NAME}
