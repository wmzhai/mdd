#!/usr/bin/env bash

export APPNAME=${1}
export IP=${2} # App Server IP
export PORT=${3} # App Server PORT
export MONGO=${4} # Mongo Server or replicaSet with port

# 安装依赖的 npm 包
meteor npm i

# 打包项目
meteor build --architecture=os.linux.x86_64  ./ --server=http://${IP}:${PORT}

# 拷贝镜像
ssh root@${IP} mkdir -p /root/${APPNAME}
scp ./*.tar.gz root@${IP}:/root/${APPNAME}

# Docker run
ssh root@${IP} docker run -d \
  -e ROOT_URL=http://${IP} \
  -e MONGO_URL="mongodb://${MONGO}/${APPNAME}?replicaSet=rs0" \
  -e MONGO_OPLOG_URL="mongodb://${MONGO}/local?replicaSet=rs0" \
  -v /root/${APPNAME}:/bundle \
  -p ${PORT}:80 \
  --name=${APPNAME} \
  wmzhai/mdd:1.3
