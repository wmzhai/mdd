#!/usr/bin/env bash
source settings

meteor npm i
meteor build --architecture=os.linux.x86_64  ./ --server=http://$IP:$PORT
ssh root@$IP mkdir -p /root/$APPNAME
scp ./*.tar.gz root@$IP:/root/$APPNAME
