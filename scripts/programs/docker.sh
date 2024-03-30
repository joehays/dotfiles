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

echo
echo '------------------------------'
echo "Installing DOCKER apt repository"
echo '------------------------------'
if [ ! -f /etc/apt/keyrings/docker.asc ]; then
  sudo install -m 0755 -d /etc/apt/keyrings
  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
  sudo chmod a+r /etc/apt/keyrings/docker.asc

  # Add the repository to Apt sources:
  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt-get update
fi

echo
echo '------------------------------'
echo "🐋 Installing Docker"
echo '------------------------------'
${APT_INSTALL} docker-ce 
${APT_INSTALL} docker-ce-cli
${APT_INSTALL} docker-compose
${APT_INSTALL} containerd.io

sudo apt autoremove -y

sudo docker run hello-world

cd ${CDW}