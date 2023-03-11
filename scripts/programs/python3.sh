#!/bin/bash

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -y $1
  else
    echo "Already installed: ${1}"
  fi
}

echo "🐍 Installing Python"
# https://realpython.com/intro-to-pyenv/#installing-pyenv
install make
install build-essential 
install libssl-dev 
install zlib1g-dev
install libbz2-dev 
install libreadline-dev 
install libsqlite3-dev 
install wget 
install curl 
install llvm 
install libncurses5-dev
install libncursesw5-dev 
install xz-utils 
install tk-dev 
install libffi-dev 
install liblzma-dev 
install python-openssl


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

# now update .bashrc
#string_to_add="export MY_VAR=my_value"
#export PATH="$HOME/.pyenv/bin:$PATH"
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
#
## Check if the string already exists in the .bashrc file
#if grep -Fxq "$string_to_add" ~/.bashrc
#then
#    echo "The string is already present in the .bashrc file"
#else
#    # Add the string to the .bashrc file
#    echo "$string_to_add" >> ~/.bashrc
#    echo "The string has been added to the .bashrc file"
#fi
#
#exec "$SHELL" # Or just restart your terminal

