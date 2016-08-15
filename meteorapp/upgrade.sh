#!/usr/bin/env bash
source settings

# Docker run
ssh root@$IP docker restart $APPNAME
