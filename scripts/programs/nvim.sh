#!/bin/bash

echo
echo '============================================================'
echo 'PROGRAMS/NVIM.SH'
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
echo 'Downloading NVIM'
echo '------------------------------'

#version="3.1.1"
filename="nvim-linux64.tar.gz"
url="https://github.com/neovim/neovim/releases/latest/download"

if [ ! -f "./${filename}" ]; then
    curl -LO "${url}/${filename}"
else
    echo "ALREADY DOWNLOADED: ${url}/${filename}" 
fi

echo
echo '------------------------------'
echo 'Installing NVIM'
echo '------------------------------'

echo "sudo rm -rf /opt/nvim"
sudo rm -rf /opt/nvim

echo "sudo tar -C /opt -xzf nvim-linux64.tar.gz"
sudo tar -C /opt -xzf nvim-linux64.tar.gz

echo '${COND_INSERT} "export PATH=\"\${PATH}:/opt/nvim-linux64/bin\"" ${HOME}/.bashrc'
${COND_INSERT} "export PATH=\"\${PATH}:/opt/nvim-linux64/bin\"" ${HOME}/.bashrc


# TODO: delete downloaded files

cd ${CWD}
