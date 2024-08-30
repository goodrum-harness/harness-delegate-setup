ARG REPOSITORY=harness
ARG IMAGE=delegate
ARG TAG=latest
FROM $REPOSITORY/$IMAGE:$TAG

USER root

# Load and configure os_packages
COPY certificates/ /opt/harness-delegate/ca-bundle/
COPY java_truststore/ /etc/pki/ca-trust/source/anchors/
COPY scripts/os_packages.txt /tmp/docker_scripts/os_packages.txt

RUN \
    echo "Load the microdnf cache"; \
    microdnf makecache; \
    echo "Update Java Truststore"; \
    update-ca-trust; \
    echo "Install Base Packages"; \
    PACKAGES=`awk '{printf("%s ",$0)} END { printf "\n" }' /tmp/docker_scripts/os_packages.txt`; \
    microdnf install ${PACKAGES};

ARG ADDITIONAL_PACKAGES
# Load and configure repository scripts
COPY scripts /tmp/docker_scripts/
RUN \
    echo "Load the microdnf cache"; \
    microdnf makecache; \
    chmod -R +x /tmp/docker_scripts;\
    /tmp/docker_scripts/updates.sh ${ADDITIONAL_PACKAGES} &&\
    rm -rf /tmp/docker_scripts;
RUN \
    microdnf update; \
    microdnf clean all

# Set the user to the `harness` user
USER 1001
