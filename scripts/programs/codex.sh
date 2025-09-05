#!/bin/bash

# export OPENAI_API_KEY="your_api_key_here"

echo
echo '============================================================'
echo 'PROGRAMS/codex.SH'
echo '============================================================'

# get my own absolute path
PROGRAMS_ABS_DIR=$(dirname $(readlink -f -- "$0"))
echo "PROGRAMS_ABS_DIR = ${PROGRAMS_ABS_DIR} "

COND_INSERT="${PROGRAMS_ABS_DIR}/../cond-insert-string-into-file"
APT_INSTALL="${PROGRAMS_ABS_DIR}/../cond-apt-install"
NPM_INSTALL="${PROGRAMS_ABS_DIR}/../cond-npm-install"
MAKE_SYMLINK="${PROGRAMS_ABS_DIR}/../cond-make-symlink"

CWD=$(pwd)

echo
echo '------------------------------'
echo 'Installing codex'
echo '------------------------------'

cd ${HOME}/Downloads
if ! command -v codex &>/dev/null; then
  echo "Installing: codex..."
  #${APT_INSTALL} curl
  #${APT_INSTALL} git
  #${APT_INSTALL} build-essential
  #${PROGRAMS_ABS_DIR}/npm.sh
  #curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
  #${APT_INSTALL} nodejs

  # Install Codex CLI globally
  ${NPM_INSTALL} @openai/codex
else
  echo "Already installed: codex"
fi

# TODO: delete downloaded files

cd ${CWD}
