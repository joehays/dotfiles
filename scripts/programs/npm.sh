#!/bin/bash
echo
echo '============================================================'
echo 'PROGRAMS/NPM.SH'
echo '============================================================'

CDW=$(pwd)

# get my own absolute path
SCRIPT_ABS_DIR=$(dirname $(readlink -f -- "$0"))
APT_INSTALL="${SCRIPT_ABS_DIR}/../cond-apt-install"

#### From: https://github.com/nodesource/distributions/blob/master/README.md
## Download and import the Nodesource GPG key
#if [ ! -f /etc/apt/keyrings/nodesource.gpg ]; then
#    sudo apt-get update
#    sudo apt-get install -y ca-certificates curl gnupg
#    sudo mkdir -p /etc/apt/keyrings
#    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
#    echo "added /etc/apt/keyrings/nodesource.gpg"
#fi
#
## Create deb repository
#if [ ! -f /etc/apt/sources.list.d/nodesource.list ]; then
#    NODE_MAJOR=21
#    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
#    echo "added /etc/apt/sources.list.d/nodesource.list"
#    sudo apt-get update
#fi
#
## Now install
#echo
#echo '------------------------------'
#echo "Installing APT packages"
#echo '------------------------------'
#${APT_INSTALL} nodejs
#${APT_INSTALL} npm
#
#
## Now make a sym link...
#
### Check if the symbolic link already exists
## link_target="/usr/bin/node"
## link_name="/usr/bin/nodejs"
##[[ -e ${link_name} ]] || ln -s ${link_target} ${link_name}
#
##sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

if ! command -v npm &>/dev/null; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
  nvm install --lts
else
  echo "Already installed: NPM"
fi

cd ${CDW}
