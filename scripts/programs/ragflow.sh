#!/bin/bash
echo
echo '============================================================'
echo 'PROGRAMS/RAGFLOW.SH'
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
${APT_INSTALL} podman
podman machine init --cpus 4 --memory 8192
podman machine start


#./ollama.sh
# Pull and run Ollama container
podman pull docker.io/ollama/ollama:latest
podman run -d --name ollama -p 11434:11434 -v ollama-models:/root/.ollama ollama/ollama

# Pull your preferred model (in this example, llama2)
podman exec -it ollama ollama pull llama2


#
#
#
#echo
#echo '------------------------------'
#echo '🐍 Creating PYENV virtualenv'
#echo '------------------------------'
#
##sys_py_version="$(python3 --version | sed 's/[^0-9.]//g')"
##py_version=sys_py_version
#py_version="3.11"
#
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
#if pyenv versions | grep -q "ragflow"; then
#  echo "ragflow virtualenv already exists..."
#else
#  pyenv virtualenv ${py_version} ragflow
#fi
#
#export PYENV_VERSION="ragflow"
#echo "PYENV_VERSION = $PYENV_VERSION"
#pip install -U pip
#pip install fastapi uvicorn streamlit chromadb ragflow langchain

echo
echo '------------------------------'
echo '🐍 Installing ragflow'
echo '------------------------------'
mkdir -p ~/ragflow-system/{workspaces,config,data}
cd ragflow-system

# from: https://ragflow.io/docs/dev/
sudo sysctl -w vm.max_map_count=262144
sudo bash -c "echo 'vm.max_map_count=262144' >> /etc/sysctl.conf"


#cd ${HOME}/Downloads
#if ! command -v pyenv >/dev/null 2>&1; then
#  curl -fsSL https://ragflow.com/install.sh | sh
#  ragflow pull llama3
#else
#  echo "ragflow is already installed"
#fi

#ragflow run llama3
#ragflow serve

#sudo systemctl enable ragflow
#sudo systemctl start ragflow
#systemctl status ragflow

echo
echo '------------------------------'
echo '🐍 Installing Open-WebUI
echo '------------------------------'

pip install open-webui

sudo apt install docker.io docker-compose -y
sudo systemctl enable --now docker


unset PYENV_VERSION

cd ${CDW}
