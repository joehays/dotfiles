#!/bin/bash

echo
echo '============================================================'
echo 'PROGRAMS/WARP.SH'
echo '============================================================'

CDW=$(pwd)

# get my own absolute path
SCRIPT_ABS_DIR=$(dirname $(readlink -f -- "$0"; ));
APT_INSTALL="${SCRIPT_ABS_DIR}/../cond-apt-install"

### From: https://github.com/nodesource/distributions/blob/master/README.md
# Download and import the Nodesource GPG key
if [ ! -f /etc/apt/keyrings/nodesource.gpg ]; then
#    sudo apt-get update
#    sudo apt-get install -y ca-certificates curl gnupg
#    sudo mkdir -p /etc/apt/keyrings
#    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg 
#    echo "added /etc/apt/keyrings/nodesource.gpg"
    sudo apt-get install wget gpg
    wget -qO- https://releases.warp.dev/linux/keys/warp.asc | gpg --dearmor > warpdotdev.gpg
    sudo install -D -o root -g root -m 644 warpdotdev.gpg /etc/apt/keyrings/warpdotdev.gpg
    sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/warpdotdev.gpg] https://releases.warp.dev/linux/deb stable main" > /etc/apt/sources.list.d/warpdotdev.list'
    rm warpdotdev.gpg
    sudo apt update
fi

# Now install
echo
echo '------------------------------'
echo "Installing APT packages"
echo '------------------------------'
${APT_INSTALL} warp-terminal

cd ${CDW}
