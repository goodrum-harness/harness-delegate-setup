#!/bin/sh
set -eo pipefail
echo "Welcome to the Harness Delegate Image builder"
echo "#############################"
echo
echo "Current Base Image OS Version"
cat /etc/redhat-release
echo
cd `dirname ${BASH_SOURCE[0]}`
echo "Verifying Requested Package installation scripts"
for package_name; do
    echo "Checking for script - ${package_name}"
    install_script="install_${package_name}.sh"
    if test -f "$install_script"; then
        echo "  Success: Installation script for ${package_name} found at ${install_script}."
    else
        echo "  ERROR: Installation script for ${package_name} was not found. Error Code ${$?}."
        exit 127
    fi
done
echo
echo "Install Requested Packages"
for package_name; do
    echo "Running script for ${package_name}"
    ./install_${package_name}.sh
done
echo "#############################"
