#!/bin/sh
# Install Kubectl
os_arch="amd64"
arch_name=`uname -m`
if [[ ${arch_name} == "aarch64" ]]; then
    os_arch="arm64"
fi

# This option will pull the most recent stable version but not be one
# currently supported within Harness
KUBECTL_VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt)
# 2024-08-29
# Hard pinning to 1.28.7 as this is the current documented version supported
# More Information can be found here - https://developer.harness.io/docs/continuous-delivery/cd-integrations
KUBECTL_VERSION=v1.28.7
echo "-> Downloading Kubectl Version - ${KUBECTL_VERSION}"
curl -sSLO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/${os_arch}/kubectl"
chmod +x ./kubectl
mv kubectl /usr/local/bin/kubectl
echo "-> Installation Complete"
kubectl version --client=true
