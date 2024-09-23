#!/bin/bash

echo
echo '============================================================'
echo 'PROGRAMS/LAZYDOCKER.SH'
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
echo 'Downloading LAZYDOCKER'
echo '------------------------------'

# NOTE: taken from: curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh 

# allow specifying different destination directory
DIR="${DIR:-"$HOME/.local/bin"}"
echo "DIR: ${DIR}"

# map different architecture variations to the available binaries
ARCH=$(uname -m)
case $ARCH in
    i386|i686) ARCH=x86 ;;
    armv6*) ARCH=armv6 ;;
    armv7*) ARCH=armv7 ;;
    aarch64*) ARCH=arm64 ;;
esac
echo "ARCH: ${ARCH}"

# prepare the download URL
GITHUB_LATEST_VERSION=$(curl -L -s -H 'Accept: application/json' https://github.com/jesseduffield/lazydocker/releases/latest | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/') 

echo "GITHUB_LATEST_VERSION: ${GITHUB_LATEST_VERSION}"

GITHUB_FILE="lazydocker_${GITHUB_LATEST_VERSION//v/}_$(uname -s)_${ARCH}.tar.gz"
echo "GITHUB_FILE: ${GITHUB_FILE}"

GITHUB_URL="https://github.com/jesseduffield/lazydocker/releases/download/${GITHUB_LATEST_VERSION}/${GITHUB_FILE}"
echo GITHUB_URL: "${GITHUB_URL}"

if [ ! -f "./lazydocker.tar.gz" ]; then
    echo "curl -L -o lazydocker.tar.gz $GITHUB_URL"
    curl -L -o lazydocker.tar.gz $GITHUB_URL
else
    echo "ALREADY DOWNLOADED: $GITHUB_URL/lazydocker.tar.gz" 
fi

echo
echo '------------------------------'
echo 'Installing LAZYDOCKER'
echo '------------------------------'

if [ ! -d "${DIR}" ]; then
  echo "mkdir -p \${DIR}"
  mkdir -p ${DIR}
fi

echo "tar xzvf lazydocker.tar.gz lazydocker"
tar xzvf lazydocker.tar.gz lazydocker

echo "install -Dm 755 lazydocker -t \"$DIR\""
install -Dm 755 lazydocker -t "$DIR"

${COND_INSERT} "alias lzd=\"lazydocker\"" ${HOME}/.bashrc
rm lazydocker lazydocker.tar.gz

cd ${CWD}
