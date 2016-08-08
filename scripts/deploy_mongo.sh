#!/usr/bin/env bash
export MSERV=${1}

# 设置 mongo db 所在根目录
ssh root@${MSERV} mkdir -p /data/db

# Docker run
ssh root@${MSERV} docker run -d \
  -p 27017:27017 \
  -v /data/db:/data/db \
  --name mongo \
  mongo --replSet "rs0"

# 初始化 replica set
ssh root@${MSERV} docker exec mongo 'mongo --eval "rs.initiate()"'
