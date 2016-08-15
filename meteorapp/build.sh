#!/usr/bin/env bash
source settings

# build output directory
rm -rf ~/output/$APPNAME
mkdir -p ~/output/$APPNAME

# build the application
meteor npm i
meteor build --architecture=os.linux.x86_64  ~/output/$APPNAME --server=http://$IP:$PORT

# upload
ssh root@$IP mkdir -p /root/bundle/$APPNAME
scp ~/output/$APPNAME/*.tar.gz root@$IP:/root/bundle/$APPNAME
