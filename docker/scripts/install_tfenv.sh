#!/bin/sh
set -e
# Install TF Env
if [ -d ~/.tfenv ]; then
    git -C ~/.tfenv pull --depth=1
else
    git clone --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv
fi
for binary_path in `ls ~/.tfenv/bin/*`;
do
    echo "${binary_path}"
    binary=`basename ${binary_path}`
    echo "Checking: /usr/local/bin/${binary}"
    if test -f "/usr/local/bin/${binary}"; then
        echo "Unlinking previous version of ${binary} to relink to current version"
        unlink /usr/local/bin/${binary}
    fi
    ln -s ~/.tfenv/bin/${binary} /usr/local/bin
done
tfenv install latest
tfenv use latest
