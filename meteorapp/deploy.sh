#!/usr/bin/env bash
source settings

# Docker run
ssh root@$IP docker run -d \
  -e ROOT_URL=http://$IP:$PORT \
  -e MONGO_URL="mongodb://$MONGO/$APPNAME?replicaSet=rs0" \
  -e MONGO_OPLOG_URL="mongodb://$MONGO/local?replicaSet=rs0" \
  -v /root/bundle/$APPNAME:/bundle \
  -p $PORT:80 \
  --name=$APPNAME \
  wmzhai/mdd:1.3
