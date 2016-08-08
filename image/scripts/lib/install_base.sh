#!/bin/bash
set -e

cp $METEORD_DIR/lib/sources.list /etc/apt/sources.list

apt-get update -y
apt-get install -y curl bzip2 build-essential python git #&& graphicsmagick imagemagick
