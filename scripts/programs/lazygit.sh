#!/bin/bash

echo
echo '============================================================'
echo 'PROGRAMS/LAZYGIT.SH'
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
echo 'Downloading LAZYGIT'
echo '------------------------------'

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
echo "LAZYGIT_VERSION=${LAZYGIT_VERSION}"

filename="lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
echo "filename=\"lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz\""

downloaded_filename="lazygit.tar.gz"
url="https://github.com/jesseduffield/lazygit/releases/latest/download"

if [ ! -f "./${downloaded_filename}" ]; then
    echo "curl -Lo ${downloaded_filename} \"${url}/${filename}\""
    curl -Lo ${downloaded_filename} "${url}/${filename}"
else
    echo "ALREADY DOWNLOADED: ${url}/${downloaded_filename}" 
fi

echo
echo '------------------------------'
echo 'Installing LAZYGIT'
echo '------------------------------'

if [ ! -d "${HOME}/apps" ]; then
  echo "mkdir -p \${HOME}/apps"
  mkdir -p ${HOME}/apps
fi

echo "tar xf ./lazygit.tar.gz --directory=${HOME}/apps"
tar xf ./lazygit.tar.gz --directory=${HOME}/apps

echo "sudo install \${HOME}/apps/lazygit /usr/local/bin"
sudo install ${HOME}/apps/lazygit /usr/local/bin

${COND_INSERT} "alias lzg=\"lazygit\"" ${HOME}/.bashrc

# TODO: delete downloaded files

cd ${CWD}
