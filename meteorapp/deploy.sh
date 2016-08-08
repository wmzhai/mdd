#!/usr/bin/env bash

export ASERV=${1} # App Server
export MSERV=${2} # Mongo Server

# 安装依赖的 npm 包
meteor npm install

# 打包项目
meteor build --architecture=os.linux.x86_64  ./ --server=http://${ASERV}

# 拷贝镜像
ssh root@${ASERV} mkdir -p /root/meteorapp
scp ./*.tar.gz root@${ASERV}:/root/meteorapp

# 拷贝 Dockerfile
ssh root@${ASERV} mkdir -p /root/mdd
scp -r ../image/* root@${ASERV}:/root/mdd

# Docker build
ssh root@${ASERV} 'cd /root/mdd && docker build -t wmzhai:mdd .'

# Docker run
ssh root@${ASERV} docker run -d \
  -e ROOT_URL=http://${ASERV} \
  -e MONGO_URL="mongodb://${MSERV}:27017/meteorapp?replicaSet=rs0" \
  -e MONGO_OPLOG_URL="mongodb://${MSERV}:27017/local?replicaSet=rs0" \
  -v /root/servers/front_end:/bundle \
  -p 80:80 \
  --name=meteorapp \
  wmzhai:mdd
