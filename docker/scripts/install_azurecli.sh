rpm --import https://packages.microsoft.com/keys/microsoft.asc
rpm -Uvh 'https://packages.microsoft.com/config/rhel/8/packages-microsoft-prod.rpm'
microdnf install azure-cli
microdnf clean all
