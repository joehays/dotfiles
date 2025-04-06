#!/bin/bash

echo
echo '============================================================'
echo 'PROGRAMS/luarocks.SH'
echo '============================================================'

# get my own absolute path
SCRIPT_ABS_DIR=$(dirname $(readlink -f -- "$0"; ));
echo "SCRIPT_ABS_DIR = ${SCRIPT_ABS_DIR} "

COND_INSERT="${SCRIPT_ABS_DIR}/../cond-insert-string-into-file"
APT_INSTALL="${SCRIPT_ABS_DIR}/../cond-apt-install"
echo "COND_INSERT = ${COND_INSERT} "

#${SCRIPT_ABS_DIR}/lua.sh

CWD=$(pwd)
cd ${HOME}/apps


echo
echo '------------------------------'
echo 'Cloning && building luarocks'
echo '------------------------------'

wget https://luarocks.org/releases/luarocks-3.11.1.tar.gz
tar zxpf luarocks-3.11.1.tar.gz
rm luarocks-3.11.1.tar.gz
cd luarocks-3.11.1
./configure --prefix=${PWD} --with-lua=${HOME}/apps/lua-5.4.7
make CC="clang" CFLAGS="-O2 -fPIC -DLUA_USE_POSIX -DLUA_USE_DLOPEN" MYCFLAGS="-fno-stack-protector"
make install

#if [ ! -d "${HOME}/apps/luarocks" ]; then
#  mkdir -p ${HOME}/apps
#  git clone git@github.com:luarocks/luarocks.git
#  cd luarocks
#  #if command -v termux-info >/dev/null 2>&1; then
#  echo "${HOME}/apps/luarocks/configure  --with-lua-include=${HOME}/apps/lua"
#  ${HOME}/apps/luarocks/configure  --with-lua-include=${HOME}/apps/lua
#  #else
#  #  ./configure --with-lua-include=/usr/local/include
#  #fi
#  make . 
#  #make install .
#fi

echo "${COND_INSERT} 'export PATH=\"${PWD}/bin:\${PATH}\"' \${HOME}/.zshrc"
${COND_INSERT} "export PATH=\"${PWD}/bin:\${PATH}\"" ${HOME}/.zshrc

echo "${COND_INSERT} 'export PATH=\"${PWD}/bin:\${PATH}\"' \${HOME}/.bashrc"
${COND_INSERT} "export PATH=\"${PWD}/bin:\${PATH}\"" ${HOME}/.bashrc


cd ${CWD}

