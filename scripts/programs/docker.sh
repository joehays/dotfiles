#!/bin/bash

CDW=$(pwd)

# get my own absolute path
SCRIPT_ABS_DIR=$(dirname $(readlink -f -- "$0"; ));
APT_INSTALL="${SCRIPT_ABS_DIR}/../cond-apt-install"

echo "installing docker dependencies"
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

#if [ ! -f /etc/apt/??? ]; then
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable"
    sudo apt update
#fi

echo "🐋 Installing Docker"
${APT_INSTALL} docker-ce 
${APT_INSTALL} docker-ce-cli
${APT_INSTALL} containerd.io

sudo docker run hello-world

cd ${CDW}