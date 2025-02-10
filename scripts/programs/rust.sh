#!/bin/bash

echo
echo '============================================================'
echo 'PROGRAMS/RUST.SH'
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
echo 'Downloading RUST'
echo '------------------------------'

#NOTE: taken from, https://wezfurlong.org/wezterm/install/linux.html

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

## TODO: delete downloaded files

cd ${CWD}
