#!/bin/sh
echo "-> Downloading Package"
rpm --import https://packages.microsoft.com/keys/microsoft.asc
rpm -Uvh 'https://packages.microsoft.com/config/rhel/9.0/packages-microsoft-prod.rpm'
microdnf install azure-cli
echo "-> Installation Complete"
az --version
