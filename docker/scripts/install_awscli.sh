#!/bin/sh
# Install AWS CLI
arch_name=`uname -m`
microdnf install glibc less

echo "-> Downloading Package"
curl -sSL0 "https://awscli.amazonaws.com/awscli-exe-linux-${arch_name}.zip" -o "awscliv2.zip"
unzip awscliv2.zip
# install
./aws/install
# Check AWS CLI install
echo "-> Installation Complete"
aws --version
