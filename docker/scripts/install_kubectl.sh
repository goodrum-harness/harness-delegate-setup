# Install Kubectl
KUBECTL_VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt)
# TODO: 2023-09-27
# Hard pinning to 1.27.6 as there is an issue with versions higher than this
# fail in Harness CD
KUBECTL_VERSION=v1.27.6
curl -LO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl"
chmod +x ./kubectl
mv kubectl /usr/local/bin/kubectl
