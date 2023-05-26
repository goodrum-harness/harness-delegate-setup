ARG REPOSITORY=harness
ARG IMAGE=delegate
ARG TAG=latest

FROM $REPOSITORY/$IMAGE:$TAG
ARG ADDITIONAL_PACKAGES

USER root

# Load and configure repository scripts
COPY --chmod=0700 scripts /tmp/docker_scripts
RUN /tmp/docker_scripts/updates.sh ${ADDITIONAL_PACKAGES};\
  rm -rf /tmp/docker_scripts

USER 1001
