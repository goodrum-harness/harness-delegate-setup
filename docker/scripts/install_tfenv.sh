#!/bin/sh
set -e
# Install TF Env
git clone --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv
ln -s ~/.tfenv/bin/* /usr/local/bin
tfenv install latest
tfenv use latest
