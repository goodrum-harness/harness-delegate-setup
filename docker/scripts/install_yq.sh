#!/bin/sh
os_arch="amd64"
arch_name=`uname -m`
if [[ ${arch_name} == "aarch64" ]]; then
    os_arch="arm64"
fi
echo "-> Downloading Package"
curl -sSL0 https://github.com/mikefarah/yq/releases/latest/download/yq_linux_${os_arch} -o /usr/bin/yq
chmod +x /usr/bin/yq
echo "-> Installation Complete"
yq --version
