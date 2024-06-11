ARG REPOSITORY=harness
ARG IMAGE=delegate
ARG TAG=latest

FROM $REPOSITORY/$IMAGE:$TAG
ARG ADDITIONAL_PACKAGES

USER root

# Load and configure repository scripts
COPY scripts /tmp/docker_scripts

RUN \
    echo "Install Base Packages"; \
    microdnf makecache; \
    PACKAGES=`awk '{printf("%s ",$0)} END { printf "\n" }' /tmp/docker_scripts/os_packages.txt`; \
    microdnf install ${PACKAGES};
RUN \
    chmod -R +x /tmp/docker_scripts;\
    /tmp/docker_scripts/updates.sh ${ADDITIONAL_PACKAGES} &&\
    rm -rf /tmp/docker_scripts;
RUN \
    microdnf update; \
    microdnf clean all

# Set the user to the `harness` user
USER 1001
