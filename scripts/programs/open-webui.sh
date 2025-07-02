t#!/bin/bash
echo
echo '============================================================'
echo 'PROGRAMS/OPEN-WEBUI.SH'
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
sudo systemctl enable --now docker

echo
echo '------------------------------'
echo '🐍 Installing Open-WebUI      '
echo '------------------------------'
#mkdir -p ${HOME}/dev
#cd ${HOME}/dev
#git clone https://github.com/open-webui/open-webui.git
#cd open-webui

#cp docker-compose.yml docker-compose.yml_original


cd ${CDW}
