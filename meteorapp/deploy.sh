#!/usr/bin/env bash
export APPNAME=${1}
export IP=${2} # App Server IP
export PORT=${3} # App Server PORT
export MONGO=${4} # Mongo Server or replicaSet with port

# Docker run
ssh root@${IP} docker run -d \
  -e ROOT_URL=http://${IP} \
  -e MONGO_URL="mongodb://${MONGO}/${APPNAME}?replicaSet=rs0" \
  -e MONGO_OPLOG_URL="mongodb://${MONGO}/local?replicaSet=rs0" \
  -v /root/${APPNAME}:/bundle \
  -p ${PORT}:80 \
  --name=${APPNAME} \
  wmzhai/mdd:1.3
