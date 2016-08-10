#!/usr/bin/env bash
export APPNAME=${1}
export IP=${2} # App Server IP

# Docker run
ssh root@${IP} docker restart ${APPNAME}
