#!/usr/bin/env bash
source settings

sh build.sh

# Docker run
ssh root@$IP docker run -d \
  -e ROOT_URL=http://$IP \
  -e MONGO_URL="mongodb://$MONGO/$APPNAME?replicaSet=rs0" \
  -e MONGO_OPLOG_URL="mongodb://$MONGO/local?replicaSet=rs0" \
  -v /root/$APPNAME:/bundle \
  -p $PORT:80 \
  --name=$APPNAME \
  wmzhai/mdd:1.3
