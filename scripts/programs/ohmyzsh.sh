#!/bin/bash

echo
echo '============================================================'
echo 'PROGRAMS/OHMYZSH.SH'
echo '============================================================'

# get my own absolute path
PROGRAMS_ABS_DIR=$(dirname $(readlink -f -- "$0"))
echo "PROGRAMS_ABS_DIR = ${PROGRAMS_ABS_DIR} "

COND_INSERT="${PROGRAMS_ABS_DIR}/../cond-insert-string-into-file"
echo "COND_INSERT = ${COND_INSERT} "

MAKE_SYMLINK="${PROGRAMS_ABS_DIR}/../cond-make-symlink"
echo "MAKE_SYMLINK = ${MAKE_SYMLINK}"

CWD=$(pwd)

echo
echo '------------------------------'
echo 'Installing OHMYZSH'
echo '------------------------------'

which omz &>/dev/null

if [ ! -f ${HOME}/.oh-my-zsh/oh-my-zsh.sh ]; then
  echo "Installing: ohmyzsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "Already installed: OHMYZSH"
fi

# TODO: delete downloaded files

cd ${CWD}
