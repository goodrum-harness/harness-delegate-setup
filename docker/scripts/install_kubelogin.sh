#!/bin/sh
set -e
echo "Downloading and installing kubelogin"
mkdir -p tmp_kubelogin
curl https://github.com/Azure/kubelogin/releases/download/v0.0.27/kubelogin-linux-amd64.zip -L -o tmp_kubelogin/kubelogin.zip
unzip -d tmp_kubelogin tmp_kubelogin/kubelogin.zip
chmod 755 tmp_kubelogin/bin/linux_amd64/kubelogin
# Add the binary to PATH
mv tmp_kubelogin/bin/linux_amd64/kubelogin /usr/local/bin
# Verify the binary
kubelogin --version
rm -rf tmp_kubelogin
