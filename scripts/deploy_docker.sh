#!/usr/bin/env bash
export DSERV=${1}

# 信任 Docker 的 GPG 公钥
ssh root@${DSERV} 'apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D'

# 添加源
ssh root@${DSERV} 'echo "deb https://mirrors.tuna.tsinghua.edu.cn/docker/apt/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list'

# 安装 Docker
ssh root@${DSERV} 'apt-get update -y && apt-get install -y docker-engine'

# 显示安装信息
ssh root@${DSERV}  'docker info'
