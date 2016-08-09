#!/usr/bin/env bash

export ASERV=${1} # App Server

# 拷贝 Dockerfile
ssh root@${ASERV} mkdir -p /root/mdd
scp -r ./* root@${ASERV}:/root/mdd

# Docker build
ssh root@${ASERV} 'cd /root/mdd && docker build -t wmzhai/mdd:1.3 .'
