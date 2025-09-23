#!/bin/bash

echo
echo '============================================================'
echo 'PROGRAMS/IMGCAT.SH'
echo '============================================================'

# get my own absolute path
SCRIPT_ABS_DIR=$(dirname $(readlink -f -- "$0"))
echo "SCRIPT_ABS_DIR = ${SCRIPT_ABS_DIR} "

COND_INSERT="${SCRIPT_ABS_DIR}/../cond-insert-string-into-file"
echo "COND_INSERT = ${COND_INSERT} "

APT_INSTALL="${SCRIPT_ABS_DIR}/../cond-apt-install"
echo "APT_INSTALL = ${APT_INSTALL} "

CWD=$(pwd)
cd ${HOME}/Downloads

echo
echo '------------------------------'
echo 'Downloading & Install IMGCAT'
echo '------------------------------'

${APT_INSTALL} build-essential
${APT_INSTALL} pkg-config
${APT_INSTALL} libncurses5-dev
${APT_INSTALL} libpng-dev
${APT_INSTALL} libjpeg-dev

cd ~/apps
git clone --recurse-submodules https://github.com/eddieantonio/imgcat.git
cd imgcat
./configure
make
sudo make install

cd ${CWD}
