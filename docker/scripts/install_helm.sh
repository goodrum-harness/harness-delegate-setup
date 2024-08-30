#!/bin/sh
os_arch="amd64"
arch_name=`uname -m`
if [[ ${arch_name} == "aarch64" ]]; then
    os_arch="arm64"
fi

HELM_VERSION="v3.9.2"
echo "-> Downloading Helm Version - ${HELM_VERSION}"
curl -sSL0 https://get.helm.sh/helm-${HELM_VERSION}-linux-${os_arch}.tar.gz -o helm-${HELM_VERSION}.tar.gz
echo "-> Extracting Package"
tar -xzf helm-${HELM_VERSION}.tar.gz
chmod +x ./linux-${os_arch}/helm
mv ./linux-${os_arch}/helm /usr/local/bin/helm3
ln -s /usr/local/bin/helm3 /usr/local/bin/helm
echo "-> Installation Complete"
helm version --template='Helm Version: {{.Version}} (installed)'
echo
