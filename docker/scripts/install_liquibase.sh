#!/bin/sh
LIQUIBASE_VERSION=4.29.1
LIQUIBASE_PREFIX=/usr/local/lib
LIQUIBASE_BIN=/usr/local/bin
mkdir ${LIQUIBASE_PREFIX}/liquibase
echo "-> Downloading Package"
curl -o /tmp/liquibase-${LIQUIBASE_VERSION}.tar.gz -sSL0 https://github.com/liquibase/liquibase/releases/download/v${LIQUIBASE_VERSION}/liquibase-${LIQUIBASE_VERSION}.tar.gz
echo "-> Extracting Package"
tar -zxf /tmp/liquibase-${LIQUIBASE_VERSION}.tar.gz -C ${LIQUIBASE_PREFIX}/liquibase
chmod +x ${LIQUIBASE_PREFIX}/liquibase/liquibase
ln -s ${LIQUIBASE_PREFIX}/liquibase/liquibase ${LIQUIBASE_BIN}
echo "-> Installation Complete"
liquibase --version
