#!/bin/bash

CDW=$(pwd)

# get my own absolute path
SCRIPT_ABS_DIR=$(dirname $(readlink -f -- "$0"; ));
MAKE_SYMLINK="${SCRIPT_ABS_DIR}/cond-make-symlink"

# Up from scripts dir
cd ${SCRIPT_ABS_DIR}/..

${MAKE_SYMLINK} .profile ${HOME}/.profile 
${MAKE_SYMLINK} .bashrc ${HOME}/.bashrc 
${MAKE_SYMLINK} .bash_profile ${HOME}/.bash_profile 
#${MAKE_SYMLINK} .config ${HOME}/.config 
${MAKE_SYMLINK} .fonts ${HOME}/.fonts 
${MAKE_SYMLINK} .git-completion.bash ${HOME}/.git-completion.bash
${MAKE_SYMLINK} .git-rundown.sh ${HOME}/.git-rundown.sh
${MAKE_SYMLINK} .vimrc ${HOME}/.vimrc

#cp .gitconfig ${HOME}
#cp .gitignore ${HOME}
#cp .gitmessage ${HOME}

cd ${CDW}