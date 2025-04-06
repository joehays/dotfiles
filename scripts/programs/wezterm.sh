#!/bin/bash

echo
echo '============================================================'
echo 'PROGRAMS/WEZTERM.SH'
echo '============================================================'

# get my own absolute path
SCRIPT_ABS_DIR=$(dirname $(readlink -f -- "$0"; ));
echo "SCRIPT_ABS_DIR = ${SCRIPT_ABS_DIR} "

COND_INSERT="${SCRIPT_ABS_DIR}/../cond-insert-string-into-file"
echo "COND_INSERT = ${COND_INSERT} "

CWD=$(pwd)
cd ${HOME}/Downloads

echo
echo '------------------------------'
echo 'Downloading WEZTERM'
echo '------------------------------'

#NOTE: taken from, https://wezfurlong.org/wezterm/install/linux.html

curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg

echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list

sudo apt update

sudo apt install wezterm

${COND_INSERT} "alias wt=\"wezterm\"" ${HOME}/.bashrc

## TODO: delete downloaded files

cd ${CWD}
