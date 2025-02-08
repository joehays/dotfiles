#!/bin/bash

echo
echo '============================================================'
echo 'PROGRAMS/VIU.SH'
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
echo 'Downloading VIU'
echo '------------------------------'

url="https://github.com/atanunq/viu.git"
dest="${HOME}/apps"

if [ ! -d "${dest}" ]; then
  mkdir -p ${dest}
fi

if [ ! -d "${dest}/viu" ]; then
    echo "git clone ${url} ${dest}"
    git clone ${url} ${dest}/viu
else
    echo "${url} is ALREADY CLONED: ${dest}/viu"
fi

echo
echo '------------------------------'
echo 'Building VIU'
echo '------------------------------'

if [ -d "${dest}/viu" ]; then
  cd ${dest}/viu
  echo "cargo install --path ."
  cargo install --path .
fi

# TODO: delete downloaded files

cd ${CWD}
