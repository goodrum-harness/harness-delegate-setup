LIQUIBASE_VERSION=4.26.0
LIQUIBASE_PREFIX=/usr/local/lib
LIQUIBASE_BIN=/usr/local/bin
mkdir ${LIQUIBASE_PREFIX}/liquibase
curl -o /tmp/liquibase-${LIQUIBASE_VERSION}.tar.gz -sSL https://github.com/liquibase/liquibase/releases/download/v${LIQUIBASE_VERSION}/liquibase-${LIQUIBASE_VERSION}.tar.gz
tar -zxf /tmp/liquibase-${LIQUIBASE_VERSION}.tar.gz -C ${LIQUIBASE_PREFIX}/liquibase
chmod +x ${LIQUIBASE_PREFIX}/liquibase/liquibase
ln -s ${LIQUIBASE_PREFIX}/liquibase/liquibase ${LIQUIBASE_BIN}
