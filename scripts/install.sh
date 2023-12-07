#!/bin/bash

CWD=$(pwd)

# get my own absolute path
SCRIPT_ABS_DIR=$(dirname $(readlink -f -- "$0"; ));

# make function aliases for both APT and NPM install scripts
APT_INSTALL="${SCRIPT_ABS_DIR}/cond-apt-install"
NPM_INSTALL="${SCRIPT_ABS_DIR}/cond-npm-install"

# Copy dotfiles
./copy.sh
vim +BundleInstall +qall  # this installs all vim extensions defined in the .vimrc file

# Update Ubuntu and get standard repository programs

##sudo apt update && sudo apt full-upgrade -y

# Basics

${APT_INSTALL} curl
${APT_INSTALL} git
${APT_INSTALL} htop
${APT_INSTALL} vim
${APT_INSTALL} wget
${APT_INSTALL} x11-apps
${APT_INSTALL} trash-cli
${APT_INSTALL} tree
${APT_INSTALL} libnss3 # needed by electron (ubuntu jammy)
${APT_INSTALL} libatk-bridge2.0-0 # needed by electron (ubuntu jammy)
${APT_INSTALL} libcups2 # needed by electron (ubuntu jammy)
${APT_INSTALL} libgtk-3-0 # needed by electron (ubuntu jammy)
${APT_INSTALL} libgbm1 # needed by electron (ubuntu jammy)
${APT_INSTALL} libasound2 # needed by electron (ubuntu jammy)
#install awscli
#install chrome-gnome-shell
#install exfat-utils
#install file
#install jq
#install yq
#install nmap
#install openvpn

# networking

# Image processing
#install gimp
#install jpegoptim
#install optipng

## Run all scripts in programs/
#for f in programs/*.sh; do bash "$f" -H; done
programs/npm.sh
programs/tldr.sh
#programs/python3.sh
#programs/vsc.sh
#programs/docker.sh

# Install NPM packages
#${NPM_INSTALL} <package>


## Get all upgrades
#sudo apt upgrade -y
#sudo apt autoremove -y

echo "cd ${CWD}"
cd ${CWD}

echo "now, run 'source ${HOME}/.bashrc'"
