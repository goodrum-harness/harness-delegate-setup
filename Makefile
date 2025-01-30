# Makefile
# Standard top-level shared Makefile switchboard to consolidate all common
# rules which will be used when testing or executing this repository.
#

# Auto-include a Makefile.local if it exists in this local directory
ifneq ("$(wildcard Makefile.local)", "")
	include Makefile.local
endif

ifeq ($(ROOT_DIR),)
	ROOT_DIR=${PWD}
endif
# Additional Docker build command flags - e.g --progress plain --no-cache
ifeq ($(BUILD_FLAGS),)
	BUILD_FLAGS=
endif
# Used for Multi-stage Dockerfiles
ifeq ($(STAGE),)
	STAGE=
endif
ifeq ($(DOCKER_COMMAND),)
	DOCKER_COMMAND=docker
endif
ifeq ($(DOCKERFILE),)
	DOCKERFILE=Dockerfile
endif
ifeq ($(DOCKER_IMAGE),)
	DOCKER_IMAGE=harness/delegate
endif
ifeq ($(DOCKER_TAG),)
	DOCKER_TAG=
endif
ifeq ($(DOCKER_ENV),)
	DOCKER_ENV:=
endif
ifeq ($(DOCKER_MOUNTS),)
	DOCKER_MOUNTS:=
endif
ifeq ($(INSTALL_PACKAGES),)
	INSTALL_PACKAGES:=all
endif
# Additional Dockerfile Build Arguments
ifeq ($(DOCKER_ARGS),)
	DOCKER_ARGS_CMD=--build-arg "TAG=${DOCKER_TAG}" --build-arg "ADDITIONAL_PACKAGES=${INSTALL_PACKAGES}"
endif
ifeq ($(PROJECT_DIR),)
	PROJECT_DIR:=${ROOT_DIR}/docker
endif
WORKDIR=/harness
DOCKER_RUN=${DOCKER_COMMAND} run --rm -it ${DOCKER_ENV} -v ${PROJECT_DIR}:/${WORKDIR} ${DOCKER_MOUNTS} -w ${WORKDIR} $(ENTRYPOINT) ${DOCKER_IMAGE}:${DOCKER_TAG}

.PHONY: validate
validate:
ifeq ($(DOCKER_TAG),)
	$(info **** COMMAND PROCESSING ISSUE ****)
	$(info The argument `DOCKER_TAG=<valid-delegate-image-source-tag>` needs to be passed along with this command)
	$(info Alternatively, this value can be stored in a Makefile.local file)
	$(info **********************************)
	$(error "Missing Argument")
endif

.PHONY: help
help:
	@grep -B1 -E "^[a-zA-Z0-9_-]+\:([^\=]|$$)" ${ROOT_DIR}/Makefile \
	 | grep -v -- -- \
	 | sed 'N;s/\n/###/' \
	 | sed -n 's/^#: \(.*\)###\(.*\):.*/\2###\1/p' \
	 | column -t  -s '###'

.PHONY: debug
#: Loads the current directory into the container to allow running commands locally
debug: validate
	$(eval ENTRYPOINT=--entrypoint sh)
	@(${DOCKER_RUN})

.PHONY: build
#: Builds the Container Image
build: validate
ifneq ($(STAGE),)
	$(eval BUILD_STAGE=--target ${STAGE})
else
	$(eval BUILD_STAGE=)
endif
	${DOCKER_COMMAND} build ${BUILD_FLAGS} ${BUILD_STAGE} -f ${PROJECT_DIR}/${DOCKERFILE} ${DOCKER_ARGS_CMD} -t ${DOCKER_IMAGE}:${DOCKER_TAG} ${PROJECT_DIR}

.PHONY: push
#: Pushes the Container Image to the remote repository
push: validate
	${DOCKER_COMMAND} push --all-platforms ${DOCKER_IMAGE}:${DOCKER_TAG}

.PHONY: clean
#: Cleans up all images associated with this ${DOCKER_IMAGE} variable
clean: validate
	@(${DOCKER_COMMAND} images --format '{{.Repository}}:{{.Tag}}' | grep ${DOCKER_IMAGE} | xargs ${DOCKER_COMMAND} rmi)
