#!/bin/sh
set -e
echo "Downloading and installing Helm 3"
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
