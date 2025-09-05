#!/bin/bash
echo
echo '============================================================'
echo 'PROGRAMS/OLLAMA.SH'
echo '============================================================'

CDW=$(pwd)

# get my own absolute path
SCRIPT_ABS_DIR=$(dirname $(readlink -f -- "$0"; ));
APT_INSTALL="${SCRIPT_ABS_DIR}/../cond-apt-install"
COND_INSERT="${SCRIPT_ABS_DIR}/../cond-insert-string-into-file"

echo
echo '------------------------------'
echo 'Installing dependencies'
echo '------------------------------'
${APT_INSTALL} curl


echo
echo '------------------------------'
echo '🐍 Creating PYENV virtualenv'
echo '------------------------------'

#sys_py_version="$(python3 --version | sed 's/[^0-9.]//g')"
#py_version=sys_py_version
#py_version="3.11"

#if command -v pyenv >/dev/null 2>&1; then
#  echo "pyenv already installed..."
#else
#  ./python3.sh
#fi
#
#if pyenv versions | grep -q "${py_version}"; then
#  echo "python ${py_version} is already installed..."
#else
#  pyenv install ${py_version}
#fi
#
#if pyenv versions | grep -q "ollama"; then
#  echo "ollama virtualenv already exists..."
#else
#  pyenv virtualenv ${py_version} ollama
#fi
#
#export PYENV_VERSION="ollama"
export PYENV_VERSION="mars"
echo "PYENV_VERSION = $PYENV_VERSION"
pip install -U pip
pip install fastapi uvicorn streamlit chromadb ollama langchain

echo
echo '------------------------------'
echo '🐍 Installing Ollama'
echo '------------------------------'
cd ${HOME}/Downloads
if ! command -v pyenv >/dev/null 2>&1; then
  curl -fsSL https://ollama.com/install.sh | sh
  ollama pull llama3
else
  echo "ollama is already installed"
fi

#ollama run llama3
#ollama serve

#sudo systemctl enable ollama
#sudo systemctl start ollama
#systemctl status ollama

#echo
#echo '------------------------------'
#echo '🐍 Installing Open-WebUI
#echo '------------------------------'
#
#pip install open-webui
#
## NOTE: need to update this to get a newer version of docker compose
#sudo apt install docker.io docker-compose -y
#sudo systemctl enable --now docker


unset PYENV_VERSION

cd ${CDW}
