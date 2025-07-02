t#!/bin/bash
echo
echo '============================================================'
echo 'PROGRAMS/DOCKER-BUILDX.SH'
echo '============================================================'

CDW=$(pwd)

# get my own absolute path
SCRIPT_ABS_DIR=$(dirname $(readlink -f -- "$0"; ));
APT_INSTALL="${SCRIPT_ABS_DIR}/../cond-apt-install"
COND_INSERT="${SCRIPT_ABS_DIR}/../cond-insert-string-into-file"

echo
echo '------------------------------'
echo 'Installing dependencies'
echo '------------------------------'
${APT_INSTALL} git
${APT_INSTALL} docker.io
${APT_INSTALL} docker-compose
#sudo systemctl enable --now docker

echo
echo '------------------------------'
echo ' Installing DOCKER-BUILDX      '
echo '------------------------------'
mkdir -p ${HOME}/.docker/cli-plugins
cd ${HOME}/Downloads
#curl -sSL https://github.com/docker/buildx/releases/latest/download/buildx-linux-amd64 \
#  -o ${HOME}/.docker/cli-plugins/docker-buildx
curl -Lo ~/.docker/cli-plugins/docker-buildx \
  https://github.com/docker/buildx/releases/download/v0.12.0/buildx-v0.12.0.linux-amd64
chmod +x ${HOME}/.docker/cli-plugins/docker-buildx

cd ${CDW}
