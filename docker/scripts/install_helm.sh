#!/bin/sh
os_arch="amd64"
arch_name=`uname -m`
if [[ ${arch_name} == "aarch64" ]]; then
    os_arch="arm64"
fi

HELM_VERSION="v3.13.3"
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

HELM_RENDER_VERSION="v0.1.5"
echo "-> Downloading Helm Post Renderer - ${HELM_RENDER_VERSION}"
curl -sSL0  https://app.harness.io/public/shared/tools/harness-helm-post-renderer/release/${HELM_RENDER_VERSION}/bin/linux/${os_arch}/harness-helm-post-renderer -o harness-helm-post-renderer-${HELM_RENDER_VERSION}
echo "-> Extracting Package"
chmod +x harness-helm-post-renderer-${HELM_RENDER_VERSION}
mv harness-helm-post-renderer-${HELM_RENDER_VERSION} /usr/local/bin/harness-helm-post-renderer-${HELM_RENDER_VERSION}
ln -s /usr/local/bin/harness-helm-post-renderer-${HELM_RENDER_VERSION} /usr/local/bin/harness-helm-post-renderer
echo "-> Installation Complete"
harness-helm-post-renderer -version
echo
