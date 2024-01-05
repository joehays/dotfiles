#!/bin/bash
echo
echo '============================================================'
echo 'PROGRAMS/DOCKER.SH'
echo '============================================================'

CDW=$(pwd)

# get my own absolute path
SCRIPT_ABS_DIR=$(dirname $(readlink -f -- "$0"; ));
APT_INSTALL="${SCRIPT_ABS_DIR}/../cond-apt-install"

echo
echo '------------------------------'
echo "Installing DOCKER dependencies"
echo '------------------------------'
${APT_INSTALL} apt-transport-https 
${APT_INSTALL} ca-certificates 
${APT_INSTALL} curl 
${APT_INSTALL} gnupg-agent 
${APT_INSTALL} software-properties-common

#if [ ! -f /etc/apt/??? ]; then
#    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
#    sudo add-apt-repository \
#       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
#       $(lsb_release -cs) \
#       stable"
#    echo 'added "https://download.docker.com/linux/ubuntu" apt-repository'
#    sudo apt update
#fi

echo
echo '------------------------------'
echo "🐋 Installing Docker"
echo '------------------------------'
${APT_INSTALL} docker-ce 
${APT_INSTALL} docker-ce-cli
${APT_INSTALL} containerd.io

sudo docker run hello-world

cd ${CDW}