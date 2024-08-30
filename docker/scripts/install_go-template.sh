#!/bin/sh
go_template_version="v4.1.0"
os_arch="amd64"
arch_name=`uname -m`
if [[ ${arch_name} == "aarch64" ]]; then
    os_arch="arm64"
fi

echo "Installing Go-Template version ${go_template_version}"
echo "-> Downloading Package"
curl -sSLO https://app.harness.io/public/shared/tools/go-template/release/v0.4.1/bin/linux/${os_arch}/go-template -o go-template
chmod +x ./go-template
mv go-template /usr/local/bin/
echo "-> Installation Complete"
go-template -v
