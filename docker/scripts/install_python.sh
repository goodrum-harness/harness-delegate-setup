#!/bin/sh
set -e
PYTHON_VERSIONS="2 3 3.11 3.12"
DEFAULT_VERSION="3.12"
for package in $PYTHON_VERSIONS; do
    echo "-> Downloading Package - ${package}"
    microdnf install python${package}
done
echo "-> Update Default Versions"
update-alternatives --set python3 /usr/bin/python${DEFAULT_VERSION}
update-alternatives --set python /usr/bin/python3

echo "-> Installation Complete"
python --version
