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

cd ${HOME}/apps
curl -L -R -O https://www.lua.org/ftp/lua-5.4.7.tar.gz
tar -zxf lua-5.4.7.tar.gz
rm lua-5.4.7.tar.gz
cd lua-5.4.7
#make linux test
install_top=${PWD}
make CC="clang" CFLAGS="-O2 -fPIC -DLUA_USE_POSIX -DLUA_USE_DLOPEN" MYCFLAGS="-fno-stack-protector"
make install INSTALL_TOP=${install_top}


#if [ ! -d "${HOME}/apps/lua" ]; then
#  mkdir -p ${HOME}/apps
#  git clone git@github.com:lua/lua.git 
#  cd lua
#  install_top=${HOME}/apps/lua
#
#  #make all test
#  if command -v termux-info >/dev/null 2>&1; then
#    make CC="clang" CFLAGS="-O2 -fPIC -DLUA_USE_POSIX -DLUA_USE_DLOPEN" MYCFLAGS="-fno-stack-protector"
#  else
#    make all test
#  fi
#fi
#
#make install INSTALL_TOP=${install_top}
  
echo "${COND_INSERT} 'export PATH=\"${install_top}/bin:\${PATH}\"' \${HOME}/.zshrc"
${COND_INSERT} "export PATH=\"${install_top}/bin:\${PATH}\"" ${HOME}/.zshrc

echo "${COND_INSERT} 'export PATH=\"${install_top}/bin:\${PATH}\"' \${HOME}/.bashrc"
${COND_INSERT} "export PATH=\"${install_top}/bin:\${PATH}\"" ${HOME}/.bashrc


cd ${CWD}


