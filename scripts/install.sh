#!/bin/bash

# TODO: 
# - make source file for all needed env-vars
# - remove redundant codes
# - add cases that test for WSL or not
# - add flags for home vs. work
# - add terminal logging to file
# - ???

CWD=$(pwd)

# get my own absolute path
SCRIPT_ABS_DIR=$(dirname $(readlink -f -- "$0"; ));

# make function aliases for both APT and NPM install scripts
APT_INSTALL="${SCRIPT_ABS_DIR}/cond-apt-install"
NPM_INSTALL="${SCRIPT_ABS_DIR}/cond-npm-install"
COND_INSERT="${SCRIPT_ABS_DIR}/cond-insert-string-into-file"

# Copy dotfiles
./copy.sh
vim +BundleInstall +qall  # this installs all vim extensions defined in the .vimrc file


# App installs
./install.common
./install.home
#./install.work


## Get all upgrades
#sudo apt upgrade -y
#sudo apt autoremove -y

echo "cd ${CWD}"
cd ${CWD}

echo "now, run 'source ${HOME}/.bashrc'"
