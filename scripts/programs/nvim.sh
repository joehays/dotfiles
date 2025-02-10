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
#filename="nvim-linux64.tar.gz"
dirname="nvim-linux-x86_64"
filename="${dirname}.tar.gz"
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

echo "sudo tar -C /opt -xzf ${filename}"
sudo tar -C /opt -xzf ${filename}

echo '${COND_INSERT} "export PATH=\"\${PATH}:/opt/${dirname}/bin\"" ${HOME}/.bashrc'
${COND_INSERT} "export PATH=\"\${PATH}:/opt/${dirname}/bin\"" ${HOME}/.bashrc
${COND_INSERT} "export PATH=\"\${PATH}:/opt/${dirname}/bin\"" ${HOME}/.zshrc

echo '${COND_INSERT} "alias nv=\"nvim\"" ${HOME}/.bashrc'
${COND_INSERT} "alias nv=\"nvim\"" ${HOME}/.bashrc
${COND_INSERT} "alias nv=\"nvim\"" ${HOME}/.zshrc


# TODO: delete downloaded files

cd ${CWD}
