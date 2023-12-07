#!/bin/bash

CDW=$(pwd)

# get my own absolute path
SCRIPT_ABS_DIR=$(dirname $(readlink -f -- "$0"; ));
APT_INSTALL="${SCRIPT_ABS_DIR}/../cond-apt-install"
COND_INSERT="${SCRIPT_ABS_DIR}/../cond-insert-string-into-file"

echo "Installing Required Packages"
# https://realpython.com/intro-to-pyenv/#installing-pyenv
${APT_INSTALL} make
${APT_INSTALL} build-essential 
${APT_INSTALL} libssl-dev 
${APT_INSTALL} zlib1g-dev
${APT_INSTALL} libbz2-dev 
${APT_INSTALL} libreadline-dev 
${APT_INSTALL} libsqlite3-dev 
${APT_INSTALL} wget 
${APT_INSTALL} curl 
${APT_INSTALL} llvm 
${APT_INSTALL} libncurses5-dev
${APT_INSTALL} libncursesw5-dev 
${APT_INSTALL} xz-utils 
${APT_INSTALL} tk-dev 
${APT_INSTALL} libffi-dev 
${APT_INSTALL} liblzma-dev 
${APT_INSTALL} python-openssl


echo "🐍 Installing PyEnv"
which pyenv &> /dev/null

if [ $? -ne 0 ]; then
  echo "Installing: pyenv..."
  CWD=$(pwd)
  cd ~/Downloads
  curl https://pyenv.run | bash
  cd $CWD
else
  echo "Already installed: pyenv"
  echo "Updating pyenv now..."
  pyenv update
fi


grep -qxF "export PYENV_ROOT=${PYENV_ROOT}" ${FILE} || $(sed -Ei -e "/^([^#]|$)/ {a \export PYENV_ROOT=${PYENV_ROOT}" -e ':a' -e '$!{n;ba};}' ${FILE})
new_string="Joe Hays" 
FILE="test"
grep -qxF "${new_string}" ${FILE} || $(sed -Ei -e "/^([^#]|$)/ {a \${new_string}" -e ':a' -e '$!{n;ba};}' ${FILE})

# now update .bashrc
${COND_INSERT} 'eval "$(pyenv init -)"' ${HOME}/.bashrc 
${COND_INSERT} 'eval "$(pyenv virtualenv-init -)"' ${HOME}/.bashrc 
${COND_INSERT} 'export PATH="${HOME}/.pyenv/bin:${PATH}"' ${HOME}/.bashrc 

#exec "$SHELL" # Or just restart your terminal
# or, better yet, source ~/.bashrc at the end of all installs

cd ${CDW}
