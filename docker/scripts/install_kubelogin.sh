#!/bin/sh
os_arch="amd64"
arch_name=`uname -m`
if [[ ${arch_name} == "aarch64" ]]; then
    os_arch="arm64"
fi
KUBELOGIN_VERSION="v0.1.1"
echo "Downloading and installing kubelogin"
mkdir -p tmp_kubelogin
echo "-> Downloading Kubelogin Version - ${KUBELOGIN_VERSION}"
curl -sSL0 https://github.com/Azure/kubelogin/releases/download/${KUBELOGIN_VERSION}/kubelogin-linux-${os_arch}.zip -o tmp_kubelogin/kubelogin.zip
unzip -d tmp_kubelogin tmp_kubelogin/kubelogin.zip
chmod 755 tmp_kubelogin/bin/linux_${os_arch}/kubelogin
# Add the binary to PATH
mv tmp_kubelogin/bin/linux_${os_arch}/kubelogin /usr/local/bin
# Verify the binary
echo "-> Installation Complete"
kubelogin --version
rm -rf tmp_kubelogin
