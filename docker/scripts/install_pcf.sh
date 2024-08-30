#!/bin/sh
# Install Cloud Foundry CLI
VERSION=8
echo "-> Downloading Package"
curl -sSL0 https://packages.cloudfoundry.org/fedora/cloudfoundry-cli.repo -o /etc/yum.repos.d/cloudfoundry-cli.repo

microdnf install cf${VERSION}-cli
echo "-> Installation Complete"
cf --version
