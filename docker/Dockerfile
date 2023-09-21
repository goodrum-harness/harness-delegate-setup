ARG REPOSITORY=harness
ARG IMAGE=delegate
ARG TAG=latest

FROM $REPOSITORY/$IMAGE:$TAG
ARG ADDITIONAL_PACKAGES

USER root

# Load and configure repository scripts
COPY scripts /tmp/docker_scripts
RUN \
  chmod -R +x /tmp/docker_scripts;\
  /tmp/docker_scripts/updates.sh ${ADDITIONAL_PACKAGES};\
  rm -rf /tmp/docker_scripts

# Set the user to the `harness` user
USER 1001
