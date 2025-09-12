#!/bin/bash
echo
echo '============================================================'
echo 'PROGRAMS/OLLAMA.SH'
echo '============================================================'

CDW=$(pwd)

# get my own absolute path
SCRIPT_ABS_DIR=$(dirname $(readlink -f -- "$0"))
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

# how to install ollama docker container?
#
#🔹 1. Make sure Docker is installed
#sudo apt update
#sudo apt install -y docker.io docker-compose
#sudo systemctl enable --now docker
#sudo usermod -aG docker $USER
#newgrp docker
#
#🔹 2. Get the Ollama Docker image
#
#Ollama now publishes an official image on Docker Hub and GitHub Container Registry.
#
## Docker Hub
#docker pull ollama/ollama:latest
#
#
#This image bundles the Ollama server and CLI.
#
#🔹 3. Run the Ollama container
#
#To keep things persistent (models, configs), mount a host volume:
#
#docker run -d \
#  --name ollama \
#  -v ollama:/root/.ollama \
#  -p 11434:11434 \
#  ollama/ollama
#
#
#-v ollama:/root/.ollama → named volume where models are cached.
#
#-p 11434:11434 → exposes Ollama’s HTTP API on your host (localhost:11434).
#
#You can also use a host directory for explicit control, e.g.:
#
#-v ~/ollama-data:/root/.ollama
#
#🔹 4. Verify it’s running
#docker ps
#curl http://localhost:11434/api/tags
#
#
#You should get a JSON response listing available models (empty if you haven’t pulled any yet).
#
#🔹 5. Use the Ollama CLI
#
#There are two ways:
#
#A) Run CLI inside the container
#docker exec -it ollama ollama run llama3
#
#B) Install just the CLI on the host, talk to Dockerized server
#
#If you want the ollama binary on your host but keep the server containerized:
#
#curl -fsSL https://ollama.com/download/OllamaInstall.sh | sh
#
#
#Then set the API endpoint:
#
#export OLLAMA_HOST=localhost:11434
#ollama run llama3
#
#
#This way the host CLI talks to the containerized server.
#
#🔹 6. Updating Ollama
#docker pull ollama/ollama:latest
#docker stop ollama && docker rm ollama
#docker run -d --name ollama -v ollama:/root/.ollama -p 11434:11434 ollama/ollama
#
#🔹 7. Optional: docker-compose setup
#
#For easier lifecycle management, create docker-compose.yml:
#
#services:
#  ollama:
#    image: ollama/ollama:latest
#    container_name: ollama
#    ports:
#      - "11434:11434"
#    volumes:
#      - ollama:/root/.ollama
#    restart: unless-stopped
#
#volumes:
#  ollama:
#
#
#Bring it up:
#
#docker compose up -d
