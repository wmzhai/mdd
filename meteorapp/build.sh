#!/usr/bin/env bash

export APPNAME=${1}
export IP=${2} # App Server IP
export PORT=${3} # App Server PORT

meteor npm i
meteor build --architecture=os.linux.x86_64  ./ --server=http://${IP}:${PORT}
ssh root@${IP} mkdir -p /root/${APPNAME}
scp ./*.tar.gz root@${IP}:/root/${APPNAME}
