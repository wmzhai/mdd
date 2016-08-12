#!/usr/bin/env bash
source settings

sh build.sh

# Docker run
ssh root@$IP docker restart $APPNAME
