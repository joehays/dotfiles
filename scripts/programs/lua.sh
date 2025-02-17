#!/bin/bash

echo
echo '============================================================'
echo 'PROGRAMS/LUA.SH'
echo '============================================================'

# get my own absolute path
SCRIPT_ABS_DIR=$(dirname $(readlink -f -- "$0"; ));
echo "SCRIPT_ABS_DIR = ${SCRIPT_ABS_DIR} "

COND_INSERT="${SCRIPT_ABS_DIR}/../cond-insert-string-into-file"
echo "COND_INSERT = ${COND_INSERT} "

CWD=$(pwd)
cd ${HOME}/apps

echo "installing 'binutils'"
if command -v termux-info >/dev/null 2>&1; then
  pkg install binutils
else
  apt install binutils
fi

echo
echo '------------------------------'
echo 'Cloning && building LUA'
echo '------------------------------'

if [ ! -d "${HOME}/apps/lua" ]; then
  mkdir -p ${HOME}/apps
  git clone git@github.com:lua/lua.git 
  cd lua
  make all test
  
  echo "${COND_INSERT} \"export PATH=\"\${PATH}:${HOME}/apps/lua\"\" ${HOME}/.zshrc"
  ${COND_INSERT} "export PATH=\"\${PATH}:${HOME}/apps/lua\"" ${HOME}/.zshrc

  echo "${COND_INSERT} \"export PATH=\"\${PATH}:${HOME}/apps/lua\"\" ${HOME}/.bashrc"
  ${COND_INSERT} "export PATH=\"\${PATH}:${HOME}/apps/lua\"" ${HOME}/.bashrc
end

# TODO: delete downloaded files

cd ${CWD}
