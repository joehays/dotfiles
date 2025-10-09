#!/bin/bash

echo
echo '============================================================'
echo 'PROGRAMS/kiwix.SH'
echo '============================================================'

# get my own absolute path
SCRIPT_ABS_DIR=$(dirname $(readlink -f -- "$0"))
echo "SCRIPT_ABS_DIR = ${SCRIPT_ABS_DIR} "

COND_INSERT="${SCRIPT_ABS_DIR}/../cond-insert-string-into-file"
echo "COND_INSERT = ${COND_INSERT} "

CWD=$(pwd)
cd ${HOME}/Downloads

echo
echo '------------------------------'
echo 'Downloading & Install kiwix'
echo '------------------------------'

sudo add-apt-repository ppa:kiwixteam/release
sudo apt update
sudo apt install kiwix

cd ${CWD}
