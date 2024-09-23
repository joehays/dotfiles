#!/bin/bash

echo
echo '============================================================'
echo 'PROGRAMS/LAZYVIM.SH'
echo '============================================================'

# get my own absolute path
SCRIPT_ABS_DIR=$(dirname $(readlink -f -- "$0"))
echo "SCRIPT_ABS_DIR = ${SCRIPT_ABS_DIR} "

APT_INSTALL="${SCRIPT_ABS_DIR}/../cond-apt-install"
COND_INSERT="${SCRIPT_ABS_DIR}/../cond-insert-string-into-file"
echo "COND_INSERT = ${COND_INSERT} "

CWD=$(pwd)
cd ${HOME}/Downloads

# NOTE: taken from, https://www.lazyvim.org/installation
echo
echo '------------------------------'
echo 'Backup existing NVIM Setup'
echo '------------------------------'

# required
if [ -d "~/.config/nvim" ]; then
  mv ~/.config/nvim{,.bak}
fi

# optional but recommended
if [ -d "~/.local/share/nvim" ]; then
  mv ~/.local/share/nvim{,.bak}
fi
if [ -d "~/.local/state/nvim" ]; then
  mv ~/.local/state/nvim{,.bak}
fi
if [ -d "~/.cache/nvim" ]; then
  mv ~/.cache/nvim{,.bak}
fi

echo
echo '------------------------------'
echo 'Installing LAZYVIM'
echo '------------------------------'

# NOTE: from https://www.lazyvim.org/

# Dependencies
echo 'installing DEPENDENCIES'
${APT_INSTALL} ripgrep # https://github.com/BurntSushi/ripgrep
${APT_INSTALL} fd-find # https://github.com/sharkdp/fd
${APT_INSTALL} luarocks

#${APT_INSTALL} kitty
#${APT_INSTALL} wazterm

echo
echo '------------------------------'
echo 'Clone Lazyvim STARTER'
echo '------------------------------'
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

echo
echo '------------------------------'
echo 'It is recommended to run :LazyHealth after installation. 
echo 'This will load all plugins and check if everything is working correctly.
echo '------------------------------'
echo

sudo npm install -g neovim

echo '${COND_INSERT} "alias lzv=\"nvim\"" ${HOME}/.bashrc'
${COND_INSERT} "alias lzv=\"nvim\"" ${HOME}/.bashrc

echo '${COND_INSERT} "alias fd=\"fdfind\"" ${HOME}/.bashrc'
${COND_INSERT} "alias fd=\"fdfind\"" ${HOME}/.bashrc

cd ${CWD}
