# Install AWS CLI
microdnf install glibc groff less
microdnf clean all

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./awscli-bundle/install -b ~/bin/aws
# install
./aws/install
# Check AWS CLI install
aws --version
